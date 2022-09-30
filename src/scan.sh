#!/bin/env zsh

source ${0:A:A:h}/utils/color.sh

for i in {${START:-0}..${END:-255}}; do
	ip=10.76.${IP3:-23}.$i:5555
	echo $(green trying) $ip
	{
		out=$(adb connect $ip 2>&1)
		[[ $out =~ 'fail*' ]] || echo $(blue succeeded) $ip
	} &
done

read -k 1
