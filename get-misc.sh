#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT

echo "- Searching for hashes with miscellaneous properties ..."

# all lower
egrep -v '[A-Z0-9\./ \#]' -r ./lists/ | sed 's/.*descrypt\-//g;s/\-allsalts.txt:/ /g' | awk '{print $2":"$1}' | sort > ./misc/descrypt-all-lower.txt
wc -l ./misc/descrypt-all-lower.txt

# all upper
egrep -v '[a-z0-9\./ \#]' -r ./lists/ | sed 's/.*descrypt\-//g;s/\-allsalts.txt:/ /g' | awk '{print $2":"$1}' | sort > ./misc/descrypt-all-upper.txt
wc -l ./misc/descrypt-all-upper.txt

# all digits - rare
egrep -v '[A-Za-z\./ \#]' -r ./lists/ | sed 's/.*descrypt\-//g;s/\-allsalts.txt:/ /g' | awk '{print $2":"$1}' | sort > ./misc/descrypt-all-digits.txt
wc -l ./misc/descrypt-all-digits.txt
