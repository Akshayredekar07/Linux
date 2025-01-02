
#! /bin/bash

read -p "Enter file or directory/file name to check exist or not : " name 
if [ -e $name ]; then 
	echo "$name exists" 
else 
	echo "$name not exists"
fi		


read -d"Enter file or directory name to check exist or not : " name 
if [ -e $name ]; then 
	echo "$name directory exists" 
else 
	echo "$name directory not exists"
fi		
