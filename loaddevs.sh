#!/bin/zsh

DEV="${DEV:-./devices}"
devs=$(cat $DEV)

for ip in $(echo -n $devs); do {
	echo trying $ip
	{ adb connect $ip 2>&1 > /dev/null && echo succeeded $ip; } &
} done

./count.sh
