#! /bin/bash  
read -p "Enter First Number:" a 
read -p "Enter Second Number:" b  

if [ $a -gt $b ] 
then
    echo "Greater Number is:$a"
else
    echo "Greater Number is:$b"
fi

