#!/bin/zsh

DEV="${DEV:-./devices}"

adb devices | tail -n +2 | awk '{ print $1 }' | tee $DEV

./count.sh
