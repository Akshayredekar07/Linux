#!/bin/bash
read -p "Enter n value: " n
for ((i=n; i>=1; i--))
do
  echo $i
  sleep 1.5
done
