#!/bin/env zsh

source ${0:A:h}/utils/color.sh

DEV="${DEV:-./devices}"
CMD="${CMD:-shell echo hello}"
LOG="${LOG:-./log}"

echo "[@: $(date +%Y/%m/%d-%H:%M:%S)] \$ adb $CMD" >> $LOG

for ip in $(<$DEV); do
	echo $(green running) \$ adb -s $ip $CMD
	echo -n "[ip: $ip] " >> $LOG
	if [[ -n "$BG" ]]; then
		adb -s $ip $(echo $CMD) 2>&1 >> $LOG &
	else
		adb -s $ip $(echo $CMD) 2>&1 >> $LOG
	fi
done

read -k 1
