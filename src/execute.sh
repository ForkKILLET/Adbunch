#!/bin/env zsh

source ${0:A:h}/utils/color.sh

DEV="${DEV:-./devices}"
CMD="${CMD:-shell echo hello}"
LOG="${LOG:-./log}"

echo "[@: $(date +%Y/%m/%d-%H:%M:%S)] \$ adb $CMD" >> $LOG

for ip in $(<$DEV); do
	echo $(green running) \$ adb -s $ip $CMD
	[[ -n "$BG" ]] && and='&'
	sed="0,/^/s//[ip: $ip] /;\$a\\"
	eval "adb -s $ip $CMD 2>&1 | sed -e '$sed' >> $LOG $and"
done

read -k 1
