#! /bin/bash

#echo -n "Enter A value: "
#read a
#echo -n "Enter B value: "
#read b

#echo "A value : $a"
#echo "B value : $b"

<<COMMENT
read -p "Enter A Value:" A
read -p "Enter B Value:" B
echo "A Value: $A"
echo "B Value: $B"
COMMENT

<<COMMENT
read -p "Enter User Name:" user
read -s -p "Enter Password:" password
echo
echo "Hello $user , thanks for your information"
COMMENT

<<COMMENT
read -p "Enter any string to find length:" str
len=$(echo -n $str | wc -c)
echo "Length of $str : $len"
COMMENT

<<COMMENT
#! /bin/bash
read -p "Enter any File name to display its content:" fname
echo "-----------------------------------------------"
cat $fname
echo "-----------------------------------------------"
COMMENT


<<COMMENT
#! /bin/bash
read -p "Enter any File name to remove blank lines:" fname
grep -v "^$" $fname > temp.txt
mv temp.txt $fname
echo "In $fname all blank lines deleted"
COMMENT

#! /bin/bash
read -p "Enter any File name to remove duplicate lines:" fname
sort -u $fname > temp.txt
mv temp.txt $fname
echo "In $fname all duplicate lines deleted"
