#!/bin/zsh

[[ -n "$CO" ]] && color="| sed -e 's/^\\(\\[[^\[]*\\]\\)/\\x1B[34m\\1\\x1B[0m/'"

[[ -n "$TL" ]] && tail="| tail -n $TL"

eval "cat ${LOG:-./log} $color $tail"
