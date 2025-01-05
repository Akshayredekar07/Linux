#! /bin/bash

read -p "Enter file/directory name to check the permission: " fname
echo "user permission summary"
if [ -r $fname ] ; then 
	echo "Read permission Yes"
else
	echo "Read permission No"
fi
	
if [ -w $fname ] ; then 
	echo "Write permission Yes"
else
	echo "Write permission No"
fi		

if [ -x $fname ] ; then 
	echo "Execute permission Yes"
else
	echo "Execute permission No"
fi	
