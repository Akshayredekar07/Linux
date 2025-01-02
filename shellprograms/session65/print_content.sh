#! /bin/bash
fname="$1"  # Quote the variable to handle spaces and special characters
if [ ! -f "$fname" ]; then  
  echo "Please provide an already existing regular file only"
  exit 1
fi

count=1
while read -r line  # Use -r to prevent backslashes from being interpreted
do
  echo "$count $line"
  let count++
done < "$fname" 
