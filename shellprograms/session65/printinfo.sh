#!/bin/bash
fname=$1

if [ ! -e "$fname" ]; then
  echo "test: $fname: No such file or directory"
  exit 1
fi

if [ -d "$fname" ]; then
  echo "test: $fname: Is a directory"
  exit 2
fi

if [ ! -s "$fname" ]; then
  echo "test: $fname: Is an empty file"
  exit 3
fi

count=1
while read line
do
	echo " $count  $line"
	let count++
done < $fname
