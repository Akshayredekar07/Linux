#! /bin/bash

read -p "Enter any string to test: " str

if [ -z $str ]; then
	echo "Provided input string is empty"
else 
	echo "The length of the provided string: $(echo -n $str | wc -c)"
fi

