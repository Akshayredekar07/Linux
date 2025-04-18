#! /bin/bash

for record in $(cat emp.txt)
do
	sal=$(echo $record | cut -d ":" -f 3)
	if [ $sal -gt 2500 ]; then
		echo $record
	fi
done
