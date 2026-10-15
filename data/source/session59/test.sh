#! /bin/bash

if [ $# -ne 2 ] ; then 
	echo "Please provide the current number of command line arguments"
	exit 1
fi

x=$1
y=$2
sum=`expr $x + $y`
if [ $? -ne 0 ]; then 
	echo "Your should provide integer numbers only"
	exit 2
fi

echo "The sum: $sum"
	
		
