#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT

EXPECTED_LENGTH=4099

>&2 echo "- Checking for unexpected hashlist lengths ..."

for file in $(ls -1 lists/descrypt*); do
    wc -l $file | grep "^${EXPECTED_LENGTH} " >/dev/null || echo "-Error: unexpected length in $file"
done

