#!/bin/env zsh
for i in {${START:-0}..${END:-255}}; do {
	ip=10.76.${IP3:-23}.$i:5555
	echo trying $ip
	{ adb connect $ip 2>&1 > /dev/null && echo succeeded $ip; } &
	{ sleep ${TIMEOUT:-0.1}; kill $! 2> /dev/null; }
} done

echo -n "(anykey) "; read -k 1
