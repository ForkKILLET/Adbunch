#!/bin/zsh

source ./utils/color.sh

DEV="${DEV:-./devices}"
devs=$(cat $DEV)

for ip in $(echo -n $devs); do
	echo $(green trying) $ip
	{
		out=$(adb connect $ip 2>&1)
		[[ $out =~ 'fail*' ]] || echo $(blue succeeded) $ip
	} & 
done

./count.sh
