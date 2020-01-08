#!/bin/bash
##################################################################################################################
# Author	: Ray Vermey
# Co-Editor	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################

#checking there is an switch behind
ARG=$1
if [ -z $ARG ]
then
	echo "This application needs arguments -n for next or -p for previous"
	exit 1
fi

#check if list with conky files exists
#if not make one
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

CONKY=`sed -n "${NEXT} p" .conky_list.txt`
# activate chosen conky
killall conky >/dev/null 2>&1
echo "conky -c $CONKY & sleep 1s" > conky-sessionfile
echo Showing [$NEXT] $CONKY
conky -c $CONKY >/dev/null 2>&1 &
