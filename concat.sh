#!/bin/sh

tmpfile=$(mktemp /tmp/mp4-concat.XXXXXX)

while [[ "$1" != "" ]] ; do
	echo "file $1" >> ${tmpfile}
	shift
done

cat ${tmpfile}

ffmpeg -f concat -safe 0 -i ${tmpfile} -c copy output.mp4
rm ${tmpfile}
