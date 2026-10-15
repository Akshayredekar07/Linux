#! /bin/bash

read -p "Enter the first file name " fname1
read -p "Enter the second file name " fname2

result=$(cmp $fname1 $fname2)

if [ -z "$result" ] ; then
	echo "The given 2 files having same content"
else
	echo "The given 2 files having different content"
fi 
		
