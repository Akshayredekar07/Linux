#! /bin/bash

read -p "Enter the any character to check its  type : " ch

case $ch in
[a-zA-Z]) echo "This is alphabet symbol" ;;
[0-9]) echo "This is digit" ;;
[a-zA-Z0-9]) echo "This is alphanumeric character" ;;
[^a-zA-Z0-9]) echo "This is special symbol" ;;
*) echo "Please enter single character only" ;;
esac


