#!/bin/bash
while [ true ]
do
  clear
  printf "\n\n\n\n\n\n\t\t\t\t$(date +%H:%M:%S)"
  sleep 1
  h=$(date +%H)
  m=$(date +%M)
  if [ "$h" -eq 23 ] && [ "$m" -eq 17 ]; then
    break
  fi
done

