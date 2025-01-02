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
