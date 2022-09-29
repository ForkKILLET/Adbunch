#!/bin/zsh

source ./utils/color.sh

echo "$(blue connected) $(( $(adb devices | wc -l) - 1 )) device(s)"
