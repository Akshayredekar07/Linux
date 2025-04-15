
### 1. Write a Script to Read Employee Data and Insert it into the `emp.txt` File.
```bash
#! /bin/bash
while [ true ]
do
 read -p "Employee Number: " eno
 read -p "Employee Name: " ename
 read -p "Employee Salary: " esal
 read -p "Employee Address: " eaddr
 echo "$eno:$ename:$esal:$eaddr" >> emp.txt
 echo "Employee Record Inserted Successfully"
 read -p "Do you want to insert one more record [Yes|No]: " option
 case $option in
 [yY]|[Yy][eE][sS])
 continue
 ;;
 [nN]|[nN][oO])
 break
 ;;
 esac
done
echo "Open emp.txt to see all employees information"
```

### 2. Write a Script to Implement the `cat` Command with `-n` Option.
```bash
#! /bin/bash
fname="$1"  # Quote the variable to handle spaces and special characters
if [ ! -f "$fname" ]; then  
  echo "Please provide an already existing regular file only"
  exit 1
fi

count=1
while read -r line  # Use -r to prevent backslashes from being interpreted
do
  echo "$count $line"
  let count++
done < "$fname" 
```

