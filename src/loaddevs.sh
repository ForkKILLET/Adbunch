#!/bin/zsh

source ${0:A:A:h}/utils/color.sh

DEV="${DEV:-./devices}"

for ip in $(<$DEV); do
	echo $(green trying) $ip
	{
		out=$(adb connect $ip 2>&1)
		[[ $out =~ 'fail*' ]] || echo $(blue succeeded) $ip
	} & 
done

${0:A:A:h}/count.sh
