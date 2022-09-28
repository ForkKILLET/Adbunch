#!/bin/env zsh

CMD="${CMD:-shell echo hello}"

for ip in $(cat ./devices); do
	echo running \$ adb -s $ip $CMD
	if [[ -n "$BG" ]]; then
		adb -s $ip $(echo $CMD) &
	else
		adb -s $ip $(echo $CMD) &
	fi
done

echo -n "(anykey) "; read -k 1
