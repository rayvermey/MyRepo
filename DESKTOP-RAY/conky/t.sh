#!/bin/bash
#chconky.sh v0.1 by Ray Vermey
#

#check if list with conky files exists
#if not make one
ARG=$1
if [ $ARG -eq "-p" ]
then
	CALC = "+"
else
	CALC = "-"
fi
	cd ~/.config/conky
	if [ ! -f .conky_list.txt ]
	then
		ls -1 *.conkyrc >.conky_list.txt
	fi

	#count total of conkys
	TOTAL_CONKYS=`wc -l .conky_list.txt | cut -d" " -f1`

	#find line starting with * - that is the active conky
	#if no active conky clear the used ones (line starting with _) and make 1st conky active
	grep -n ^\* .conky_list.txt >/dev/null 2>&1
	FOUND=$?
	if [ $FOUND -eq 1 ]
	then
		NEXT=$TOTAL_CONKYS
		CONKY=`sed -n "$NEXT p" .conky_list.txt| sed 's/^\*//'`
		#sed -i "s/^_//" .conky_list.txt
		NEXT=$((NEXT $CALC 1))
		sed -i "${NEXT}s/^/*/" .conky_list.txt
		ACTIVE_LINE=$TOTAL_CONKYS
	else
		ACTIVE_LINE=`grep -n ^\* .conky_list.txt | cut -d: -f1`
		CONKY=`sed -n "$ACTIVE_LINE p" .conky_list.txt | sed 's/^\*//'`
		NEXT=$((ACTIVE_LINE $CALC 1))
		if [ $NEXT -lt 1 ]
		then
			NEXT=$TOTAL_CONKYS
			sed -i "1s/^*//" .conky_list.txt
			sed -i "${NEXT}s/^/*/" .conky_list.txt
		else	
			NEXT=$((ACTIVE_LINE $CALC 1))
			sed -i "${NEXT}s/^/*/" .conky_list.txt
			sed -i "${ACTIVE_LINE}s/*//" .conky_list.txt
		fi
	fi

	# activate chosen conky
	killall conky >/dev/null 2>&1
	echo Showing $CONKY
	conky -c $CONKY >/dev/null 2>&1 &

	# put active conky in conky-sessionfile
	echo "conky -c $HOME/.config/conky/$CONKY & sleep 1s" > conky-sessionfile
