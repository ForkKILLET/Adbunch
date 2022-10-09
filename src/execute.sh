#!/bin/env zsh

source ${0:A:h}/utils/color.sh

DEV="${DEV:-./devices}"
LOG="${LOG:-./log}"

cmd=${@:-shell echo hello}

echo "[@: $(date +%Y/%m/%d-%H:%M:%S)] \$ adb $cmd" >> $LOG

for ip in $(<$DEV); do
	echo $(green running) \$ adb -s $ip $cmd
	[[ -n "$BG" ]] && and='&'
	sed="0,/^/s//[ip: $ip] /;\$a\\"
	eval "adb -s $ip $cmd 2>&1 | sed -e '$sed' >> $LOG $and"
done

read -k 1
