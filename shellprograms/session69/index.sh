#!/bin/bash
declare -a fruits
fruits[10]="Apple"
fruits[20]="Banana"
fruits[30]="Orange"
fruits[40]="Mango"

echo "Access based on values: "
for fruit in ${fruits[@]}
do
echo $fruit
done

echo
echo "Accessing based on index: "
for index in ${!fruits[@]}
do
echo "${fruits[$index]}"
done

