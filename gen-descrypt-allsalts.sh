#!/bin/bash
#-----------------------------------------------------------------------------
# Generate all valid descrypts for a given string.
# From https://github.com/roycewilliams/kens-salty-rainbow
# License: MIT
#-----------------------------------------------------------------------------
MDXFIND=$(which mdxfind 2>/dev/null)

if [ -z "$1" ]; then
    echo "- Usage: $0 [plaintext]"
    exit 1
else
    PLAINTEXT=$(echo $* | cut -b1-8)
    >&2 echo "- Processing plaintext: \"${PLAINTEXT}\""
fi

#-----------------------------------------------------------------------------
# If we have mdxfind, use it
if [ ! -z "${MDXFIND}" -a -x "${MDXFIND}" ]; then

    echo -n ${PLAINTEXT} | mdxfind -h '^DESCRYPT$' -z -f /dev/null stdin 2>/dev/null | egrep '^DESCRYPT' | cut -d\  -f2 | cut -d: -f1

else
    echo "--- mdxfind not found - falling back to slower generation with openssl"
    SALTCHARS=". / 0 1 2 3 4 5 6 7 8 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z"

    # If we don't have mdxfind, use openssl
    for salt1 in ${SALTCHARS}; do
        for salt2 in ${SALTCHARS}; do
            echo -n ${PLAINTEXT} | openssl passwd -stdin -salt ${salt1}${salt2}
        done
    done
fi

#-----------------------------------------------------------------------------
