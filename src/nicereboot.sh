#!/bin/zsh

source ${0:A:h}/utils/color.sh

BG=1 CMD="shell reboot" ${0:A:h}/execute.sh

echo $(green reloading devs)
${0:A:h}/loaddevs.sh > /dev/null
