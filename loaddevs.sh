#!/bin/zsh

devs=$(cat ./devices)

for ip in $(echo -n $devs); do {
	echo trying $ip
	{ adb connect $ip 2>&1 > /dev/null && echo succeeded $ip; } &
} done

./count.sh
