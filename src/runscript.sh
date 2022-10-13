#!/bin/zsh

source ${0:A:h}/utils/color.sh

SDIR=${SDIR:-/sdcard/adbunch/scripts}
s="${1:t}"

if [[ -z "$REM" ]]; then
	echo "$(green pushing script) $1"

	NOGC=1 ${0:A:h}/execute.sh shell mkdir -p $SDIR > /dev/null
	NOGC=1 ${0:A:h}/execute.sh push "$1" $SDIR > /dev/null
fi

echo "$(green executing script) $SDIR/$s"

NOGC=1 ${0:A:h}/execute.sh shell sh "'$SDIR/$s'" > /dev/null

${0:A:h}/log.sh
