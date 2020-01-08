cd ~/.config/conky

grep -n ^\* .conky_list.txt >/dev/null 2>&1
FOUND=$?
if [ $FOUND -eq 1 ]
then
	NEXT=0
	sed -i "1s/^/*/" .conky_list.txt
	ACTIVE_LINE=1	
	CONKY=`sed -n "$ACTIVE_LINE p" .conky_list.txt`
else
	ls -1 *.conkyrc >.conky_list.txt
	ACTIVE_LINE=`grep -n ^* .conky_list.txt| cut -d: -f1`
	CONKY=`sed -n "$ACTIVE_LINE p" .conky_list.txt`
fi
	if [ $ACTIVE_LINE -ge 1 ]
	then
		NEXT=$((ACTIVE_LINE + 1))
	fi

NEXT_CONKY=`sed -n "$NEXT p" .conky_list.txt`
sed -i "${NEXT}s/^/*/" .conky_list.txt
sed -i "${ACTIVE_LINE}s/^\*/_/" .conky_list.txt
killall conky >/dev/null 2>&1
echo Showing $CONKY
conky -c $CONKY >/dev/null 2>&1 &
