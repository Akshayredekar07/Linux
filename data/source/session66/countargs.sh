#! /bin/bash
if [ $# -ne 0 ]; then
	count=1
	for args in "$@"
	do 
		echo "Command line argument -$count: $args"
		let count++
	done
else
	echo "command line argument is not passed"
fi
