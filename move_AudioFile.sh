#!/bin/sh

FILENAME="*.m4a"

# 'alac':Apple Lossless, 'aac ':AAC
FILETYPE="alac"
# FILETYPE="aac "


# Except Escape Sequence
SRC="/Users/mntaym/Music/iTunes/iTunes Media/Music/"
DST="/Volumes/home/Music/Master/"

PWD=`pwd`
TARGETDIR=${PWD#${SRC}}

echo ${DST}${TARGETDIR}

# Make Directory
if ! [ -e "${DST}${TARGETDIR}" ]; then
  mkdir -p "${DST}${TARGETDIR}"
fi

# Move
for FILEPATH in ${FILENAME}
do
  afinfo "${PWD}/${FILEPATH}" | grep "^Data format: " | grep "'${FILETYPE}'" > /dev/null
  if [ "$?" -eq 0 ]; then
    mv "${PWD}/${FILEPATH}" "${DST}${TARGETDIR}"
  fi
done
