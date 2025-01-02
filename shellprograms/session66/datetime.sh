#! /bin/bash
for fname in *.txt
do
  date >> "$fname"
  cal >> "$fname"
done
echo "Task Completed"
