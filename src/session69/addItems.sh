#!/bin/bash

# Read number of values
read -p "Enter the number of values: " n

# Read numbers and store them in the array
for ((i=0, j=1; i<n; i++, j++))
do
  read -p "Enter the number-$j: " NUM[$i]
done

# Initialize sums for even and odd numbers
esum=0
osum=0

# Arrays to store even and odd numbers
even_nums=()
odd_nums=()

# Calculate the sum of even and odd numbers and store them in respective arrays
for val in "${NUM[@]}"
do
  if [ $((val % 2)) -eq 0 ]; then
    let esum+=val
    even_nums+=($val)
  else
    let osum+=val
    odd_nums+=($val)
  fi
done

# Print the results
echo "Even Numbers: ${even_nums[@]}"
echo "The sum of even numbers: $esum"
echo "Odd Numbers: ${odd_nums[@]}"
echo "The sum of odd numbers: $osum"

