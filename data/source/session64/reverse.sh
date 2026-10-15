#! /bin/bash
read -p "Enter any string to find reverse: " str   # Step 1: Read input string
len=$( echo -n $str | wc -c )   # Step 2: Calculate the length of the string
output=""  # Step 3: Initialize an empty string to store the reversed string

while [ $len -gt 0 ]   # Step 4: Loop until the length becomes 0
do
    ch=$( echo -n $str | cut -c $len )   # Step 5: Extract the character at the current position
    output=$output$ch   # Step 6: Append the character to the output string
    let len--   # Step 7: Decrement the length by 1 to move to the previous character
done

echo "The Original String: $str"   # Step 8: Print the original string
echo "The Reversed String: $output"   # Step 9: Print the reversed string
