#!/bin/bash

# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT

LISTDIR=./lists/

#DEBUG=echo
DEBUG=

echo "- Creating any missing hash directories ..."

for char1 in $(cut -b1 password.list | sort -u); do

    DESTDIR=${LISTDIR}/$char1/
    if [ ! -d ${DESTDIR} ]; then
        echo "-Creating missing directory: ${DESTDIR}"
        ${DEBUG} mkdir ${DESTDIR}
    fi

    # Just used during conversion.
    #MOVEFILES=$(ls -1 ${LISTDIR}/descrypt-${char1}*)
    #for movefile in ${MOVEFILES}; do
    #    echo "- Moving ${movefile} to ${LISTDIR}/${char1}/ ..."
    #    ${DEBUG} mv ${movefile} ${LISTDIR}/${char1}/
    #done

done
echo ""
