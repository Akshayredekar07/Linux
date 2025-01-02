#! /bin/bash

read -p "Enter First String:" str1
read -p "Enter Second String:" str2

if [ $str1 = $str2 ]; then
 	echo "Both strings are equal"
elif [ $str1 \< $str2 ]; then
 	echo "$str1 is less than $str2"
else
 	echo "$str1 is greater than $str2"
fi


