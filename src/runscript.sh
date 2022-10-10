#!/bin/zsh

source ${0:A:A:h}/utils/color.sh

SDIR=${SDIR:-/sdcard/adbunch/scripts}

echo "$(green pushing script) $1"

NOGC=1 ${0:A:h}/execute.sh shell mkdir -p $SDIR > /dev/null
NOGC=1 ${0:A:h}/execute.sh push "$1" $SDIR > /dev/null

echo "$(green executing script) $SDIR/$1"

NOGC=1 ${0:A:h}/execute.sh shell sh "'$SDIR/$1'" > /dev/null

${0:A:h}/log.sh | tail -n 50
