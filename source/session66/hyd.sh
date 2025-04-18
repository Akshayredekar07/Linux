#! /bin/bash
for record in $(cat emp.txt)
do
  sal=$(echo $record | cut -d ":" -f 3)
  city=$(echo $record | cut -d ":" -f 4)
  if [ $sal -gt 2500 -a $city = "Hyderabad" ]; then
    echo $record >> hyd.txt
  fi
done
echo "Task Completed"
