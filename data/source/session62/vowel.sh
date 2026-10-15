#! /bin/bash
read -p "Enter Any Character to check: " ch
case $ch in
  [^a-zA-Z0-9]) echo "It is a Special Character" ;;
  [0-9]) echo "It is a Digit" ;;
  [aeiouAEIOU]) echo "It is a Vowel" ;;
  [^aeiouAEIOU]) echo "It is a Consonant" ;;
  *) echo "Enter only one character" ;;
esac
