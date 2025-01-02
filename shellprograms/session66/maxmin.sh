#!/bin/bash

max=$(cat emp.txt | head -1 | cut -d ":" -f 3)
for record in $max
do
    sal=$(echo $record | cut -d ":" -f 3)
    if [ $sal -gt $max ]; then
	max=$sal
    fi
done

echo "Maximum salary: $max"
