#!/bin/zsh

root=${0:A:h}/..
root=${root:A}

alls () {
	local -a all
	for f in $root/*.sh; do
		all+="${f:t:r}"
	done

	echo $all
}
