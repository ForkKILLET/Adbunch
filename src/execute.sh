#!/bin/env zsh

source ./utils/color.sh

DEV="${DEV:-./devices}"
CMD="${CMD:-shell echo hello}"
LOG="${LOG:-./log}"

echo "\$ adb $CMD" >> $LOG

for ip in $(<$DEV); do
	echo $(green running) \$ adb -s $ip $CMD
	if [[ -n "$BG" ]]; then
		adb -s $ip $(echo $CMD) 2>&1 >> $LOG &
	else
		adb -s $ip $(echo $CMD) 2>&1 >> $LOG
	fi
done

read -k 1
