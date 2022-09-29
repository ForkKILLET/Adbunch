#!/bin/env zsh

DEV="${DEV:-./devices}"
CMD="${CMD:-shell echo hello}"
LOG="${LOG:-./log}"

echo \$ adb $CMD >> $LOG

for ip in $(cat $DEV); do
	echo running \$ adb -s $ip $CMD
	if [[ -n "$BG" ]]; then
		adb -s $ip $(echo $CMD) 2>&1 >> $LOG &
	else
		adb -s $ip $(echo $CMD) 2>&1 >> $LOG
	fi
done

echo -n "(anykey) "; read -k 1
