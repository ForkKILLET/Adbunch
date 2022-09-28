#!/bin/env zsh

DEV="${DEV:-./devices}"
CMD="${CMD:-shell echo hello}"
LOG="${LOG:-./adb.log}"

for ip in $(cat $DEV); do
	echo running \$ adb -s $ip $CMD | tee -a $LOG
	if [[ -n "$BG" ]]; then
		adb -s $ip $(echo $CMD) >> $LOG &
	else
		adb -s $ip $(echo $CMD) >> $LOG
	fi
done

echo -n "(anykey) "; read -k 1
