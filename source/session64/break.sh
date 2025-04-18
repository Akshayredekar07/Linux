#!/bin/bash
i=1
while [ "$i" -le 10 ]
do
  if [ "$i" -eq 5 ]; then
    break
  fi
  echo "$i"
  i=$((i + 1))
done

