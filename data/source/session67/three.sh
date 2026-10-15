#!/bin/bash

read -p "Enter the number for multiplication table: " n
count=1
for ((i=1; i<=10; i++))
do
  echo "$n * $i = $[n*i]"
done
