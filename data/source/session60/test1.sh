#! /bin/bash

read -p "Enter file name to test: " fname

if [ -e $fname ] ; then 
	if [ -f $fname ] ; then 
		echo "$fname is a regular file"
	elif [ -d $fname ] ; then 
		echo "$fname is directory"	
	else
		echo "$fname is a special file"
	fi
else 
	echo "File dosn't exist"	
fi


