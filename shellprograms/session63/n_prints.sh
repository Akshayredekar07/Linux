#!/bin/bash
read -p "Enter the limit:" n
i=1
while [ "$i" -le $n ]
do
  echo "$i"
  i=$((i + 1))
done
