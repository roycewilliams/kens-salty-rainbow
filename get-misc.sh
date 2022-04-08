#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT

echo "- Searching for hashes with miscellaneous properties ..."

:sa
:wq
# all lower
wc -l ./misc/descrypt-all-lower.txt
grep -ev '[A-Z0-9\./ \#]' -r ./lists/ | sed 's/.*descrypt\-//g;s/\-allsalts.txt:/ /g' | awk '{print $2":"$1}' | sort > ./misc/descrypt-all-lower.txt
wc -l ./misc/descrypt-all-lower.txt

# all upper
wc -l ./misc/descrypt-all-upper.txt
grep -ev '[a-z0-9\./ \#]' -r ./lists/ | sed 's/.*descrypt\-//g;s/\-allsalts.txt:/ /g' | awk '{print $2":"$1}' | sort > ./misc/descrypt-all-upper.txt
wc -l ./misc/descrypt-all-upper.txt

# all digits - rare
wc -l ./misc/descrypt-all-digits.txt
grep -ev '[A-Za-z\./ \#]' -r ./lists/ | sed 's/.*descrypt\-//g;s/\-allsalts.txt:/ /g' | awk '{print $2":"$1}' | sort > ./misc/descrypt-all-digits.txt
wc -l ./misc/descrypt-all-digits.txt
