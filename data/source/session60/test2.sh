#! /bin/bash

read -p "Enter file name to test: " fname

if [ -e $fname ] ; then 
	if [ -f $fname ] ; then 
		if [ -r $fname ] ; then 
			echo "---------------------------------------------------"
			cat $fname
			echo "---------------------------------------------------"
		else
			echo "User dont have the read permission"
		fi
	else
		echo "$fname is not a regula file"
	fi
else 
	echo "$fname  not exists"
fi
					
