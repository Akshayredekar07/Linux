#!/bin/bash

declare -a fruits
fruits=("Apple" "Banana" "Orange" "Mango")
size=${#fruits[@]}
i=0

echo "Print all fruits using while loop"
while [ $i -lt $size ]
do
    echo "${fruits[$i]}"
    let i++
done

echo "All elements by using for loop:"
for fruit in "${fruits[@]}"
do
  echo $fruit
done

echo "All elements by using advanced for loop:"
for (( i=0; i < ${#fruits[@]}; i++ ))
do
  echo ${fruits[$i]}
done
