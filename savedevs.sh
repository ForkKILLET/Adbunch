#!/bin/zsh

adb devices | tail -n +2 | awk '{ print $1 }' | tee ./devices

./count.sh
