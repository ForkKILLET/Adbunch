#!/bin/zsh

source ./utils/color.sh

DEV="${DEV:-./devices}"

for ip in $(<$DEV); do
	echo $(green trying) $ip
	{
		out=$(adb connect $ip 2>&1)
		[[ $out =~ 'fail*' ]] || echo $(blue succeeded) $ip
	} & 
done

./count.sh
