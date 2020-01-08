#!/bin/bash
#chconky.sh v0.1 by Ray Vermey
#

#check if list with conky files exists
#if not make one
ARG=$1
cd ~/.config/conky
if [ ! -f .conky_list.txt ]
then
	find /home/$USER/ -name "*.conkyrc" | grep -v backup | grep -v Trash >.conky_list.txt
fi

#count total of conkys
TOTAL_CONKYS=`wc -l .conky_list.txt | cut -d" " -f1`
#
#find active conky in conky-sessionfile
#
ACTIVE_CONKY=`cat ~/.config/conky/conky-sessionfile | cut -d" " -f3`
LINE_ACTIVE_CONKY=`grep -n $ACTIVE_CONKY .conky_list.txt| cut -d: -f1`

	NEXT=$LINE_ACTIVE_CONKY
	if [ $ARG == "-p" ]
	then
		NEXT=$((NEXT - 1))
	elif [ $ARG == "-n" ]
	then
		NEXT=$((NEXT + 1))
	fi
	if [ $NEXT -gt $TOTAL_CONKYS ]
	then
		NEXT=1
	elif [ $NEXT -lt 1 ]
	then
		NEXT=$TOTAL_CONKYS
	fi
#	CONKY=`sed -n "$NEXT p" .conky_list.txt`

CONKY=`sed -n "${NEXT} p" .conky_list.txt`
# activate chosen conky
killall conky >/dev/null 2>&1
echo "conky -c $CONKY & sleep 1s" > conky-sessionfile
echo Showing $CONKY
conky -c $CONKY >/dev/null 2>&1 &
