#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# Created: 2020-06-04
# License: MIT

echo "Checking for plaintexts without hash lists ..."

INPUT_FILE=password.list

if [ ! -z "$1" -a -f "$1" ]; then
    echo "Using alternate input file $1"
    INPUT_FILE=$1
fi

for plaintext in $(cat ${INPUT_FILE}); do

    ALLSALTS_FILE=./lists/descrypt-${plaintext}-allsalts.txt

    if [ -f ${ALLSALTS_FILE} ]; then

        echo "List for plaintext \"${plaintext}\" exists, skipped."

    else

        >&2 echo "List for plaintext \"${plaintext}\" missing, generating ..."
        echo "# All possible descrypt hashes of the password \"${plaintext}\", using all possible salts." >${ALLSALTS_FILE}
        echo "# If you find a device that always uses one of these, let me know." >>${ALLSALTS_FILE}

        ./gen-descrypt-allsalts.sh ${plaintext} >> ${ALLSALTS_FILE}

        ls -la ${ALLSALTS_FILE}
        wc -l ${ALLSALTS_FILE}
        head -n 10 ${ALLSALTS_FILE} | egrep -v '^#' | head -n 1
        tail -n 1 ${ALLSALTS_FILE}
        echo ""

    fi

done

