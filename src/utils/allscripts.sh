#!/bin/zsh

alls () {
	local all=
	for f in ${0:A:h}/src/*.sh; do
		all+="${f:t:r} "	
	done

	echo $all
}
