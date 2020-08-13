#!/bin/bash
#-----------------------------------------------------------------------------
# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT
# Created: 2020-06-04
#-----------------------------------------------------------------------------

VERBOSE=

#-----------------------------------------------------------------------------

# Expand any new basewords into their variants.
./leet-new.sh

# If a 'hash' directory doesn't exist, create it.
./make-hashdir.sh

echo "- Normalizing password lists ..."
echo -n "--- Before: "
wc -l password.list
cat password-base.list >>password.list
sort -u -o password.list password.list
echo -n "--- After:  "
wc -l password.list
echo ""

echo "- Checking for plaintexts without hash lists ..."

INPUT_FILE=password.list

if [ ! -z "$1" -a -f "$1" ]; then
    echo "--- Using alternate input file $1"
    INPUT_FILE=$1
fi

for plaintext in $(cat ${INPUT_FILE}); do

    char1=$(echo $plaintext | cut -b1)

    ALLSALTS_FILE=./lists/${char1}/descrypt-${plaintext}-allsalts.txt

    if [ -f ${ALLSALTS_FILE} ]; then

        [ "${VERBOSE}" ] && echo "--- List for plaintext \"${plaintext}\" exists, skipped."

    else

        >&2 echo "--- List for plaintext \"${plaintext}\" missing, generating ..."
        echo "# All possible descrypt hashes of the password \"${plaintext}\", using all possible salts." >${ALLSALTS_FILE}
        echo "# From https://github.com/roycewilliams/kens-salty-rainbow" >>${ALLSALTS_FILE}
        echo "# If you find a device that always uses one of these, let me know." >>${ALLSALTS_FILE}

        ./gen-descrypt-allsalts.sh ${plaintext} >> ${ALLSALTS_FILE}

        ls -la ${ALLSALTS_FILE}
        wc -l ${ALLSALTS_FILE}
        head -n 10 ${ALLSALTS_FILE} | egrep -v '^#' | head -n 1
        tail -n 1 ${ALLSALTS_FILE}
        echo ""

        git add ${ALLSALTS_FILE}

    fi

done

echo - "Updating total ..."
TOTALWORDS=$(cat password.list | wc -l)

sed -i.bak "s~<\!-- counter -->.*<\!-- endcounter -->~<\!-- counter --> ${TOTALWORDS} <\!-- endcounter -->~g" README.md


git add lists/*
git add lists/*/*

echo ""
echo "- Done."
echo ""

#-----------------------------------------------------------------------------
