#!/bin/env zsh

source ${0:A:h}/utils/color.sh

ippat=(${(s[.])1})
port=${2:-5555}

try-ip () {
	local ip=$1
	echo $(green trying) $ip
	{
		out=$(adb connect $ip 2>&1)
		[[ $out =~ 'fail*' ]] || echo $(blue succeeded) $ip
	} &
}

exp=()

for pat in $ippat; do
	if [[ $pat = '-' ]]; then
		exp+="{0..255}"
	elif [[ $pat =~ '^[0-9]+-[0-9]+$' ]]; then
		range=(${(s[-])pat})
		exp+="{${range[1]}..${range[2]}}"
	elif [[ $pat =~ '^[0-9]+$' ]]; then
		exp+="$pat"
	else
		echo $(red illegal pattern: $pat)
		exit 1
	fi
done

ipe="${(j[.])exp}:$port"
eval "for ip in $ipe; do try-ip \$ip; done"

read -k 1
