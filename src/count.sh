#!/bin/zsh

source ${0:A:h}/utils/color.sh

echo "$(blue connected) $(( $(adb devices | wc -l) - 1 )) device(s)"
