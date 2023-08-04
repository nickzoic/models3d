#!/bin/bash
set -eu
SOURCE=$1
TARGET=${2:-${SOURCE%.*}.amf}
TEMPDIR=`mktemp -d`
for MATERIAL in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16; do
    echo -e "---\nEXPORTING MATERIAL $MATERIAL"
    openscad -D material=$MATERIAL -o $TEMPDIR/temp$MATERIAL.amf "$SOURCE" || echo "FAILED"
done
echo -e "---\nCOMBINING INTO $TARGET"
./combine_amf.py $TEMPDIR/temp*.amf > "$TARGET"
echo -e "---\nDONE\n"
rm -r $TEMPDIR
