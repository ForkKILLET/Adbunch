#!/bin/zsh

source ${0:A:h}/utils/color.sh

BG=1 ${0:A:h}/execute.sh shell reboot

echo $(green reloading devs)
${0:A:h}/loaddevs.sh > /dev/null
