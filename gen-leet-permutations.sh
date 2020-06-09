#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT

mdxfind -h '^NULL$' -z -f /dev/null stdin \
    -R leet-single.rule -R leet-single.rule -R leet-single.rule -R leet-single.rule \
    -R leet-single.rule -R leet-single.rule -R leet-single.rule -R leet-single.rule \
    | cut -d: -f2- \
    | awk '{c[$0]++} END {for (line in c) print line}'

