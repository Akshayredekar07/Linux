#! /bin/bash

read -p "Enter any digit  from 0 to 9 : "  n

case $n in
0) echo "Zero" ;;
1) echo "One" ;;
2) echo "Two" ;;
3) echo "Three" ;;
4) echo "Four" ;;
5) echo "five" ;;
6) echo "Six" ;;
7) echo "Seven" ;;
8) echo "Eight" ;;
9) echo "nine" ;;
*) echo "Plase enter the number in the range of 0 to 9 only " ;;
esac
