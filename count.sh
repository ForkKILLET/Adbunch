#!/bin/zsh
echo "connected $(( $(adb devices | wc -l) - 1 )) device(s)"
