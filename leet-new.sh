#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT

sort -u -o password-base.list password-base.list

echo "- Checking for un-leet words (up to ten) ..."
BASELIST=$(grep -h -i [a-z]  password.list password-base.list | tr [A-Z] [a-z] | sort -u)
NEWLIST=$(for word in ${BASELIST}; do
    grep "^$(echo $word | tr [a-z] [A-Z])$" password.list >/dev/null || echo "$word"
done | cut -b1-8 | sort -u | head -n 10)

if [ ! -z "${NEWLIST}" ]; then
    echo "- Will leet-ify new words:"
    echo "${NEWLIST}"
    echo ""
    echo "- Press Enter to leet-ify these words, or Control-Break to abort:"
    read blah
    echo ""

    echo ${NEWLIST} | tr '[:blank:]' '\n' | ./gen-leet-permutations.sh | tee -a password.list
    echo ""

    sort -u -o password.list password.list
    echo ""
else
    echo "- No un-leet words found."
    echo ""
fi

