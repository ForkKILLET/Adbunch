#!/bin/zsh
BG=1 CMD="shell reboot" ./execute.sh
echo loading devs
./loaddevs.sh > /dev/null
