#!/bin/zsh

source ${0:A:A:h}/utils/color.sh

BG=1 CMD="shell reboot" ${0:A:A:h}/execute.sh

echo $(green loading) devs
${0:A:A:h}/loaddevs.sh > /dev/null
