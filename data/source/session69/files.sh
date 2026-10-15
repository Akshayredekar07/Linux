#!/bin/bash

# Store all .txt files in the current directory into an array
files=($(ls *.txt))

# Loop through each file and print permissions
for fname in "${files[@]}"
do
  echo -ne "$fname:\t"
  
  # Check read permission
  if [ -r "$fname" ]; then
    echo -ne "READ(Y)\t"
  else
    echo -ne "READ(N)\t"
  fi
  
  # Check write permission
  if [ -w "$fname" ]; then
    echo -ne "WRITE(Y)\t"
  else
    echo -ne "WRITE(N)\t"
  fi
  
  # Check execute permission
  if [ -x "$fname" ]; then
    echo "EXECUTE(Y)"
  else
    echo "EXECUTE(N)"
  fi
done

