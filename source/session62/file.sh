#! /bin/bash
echo "A Display Content"
echo "B Append Content"
echo "C Overwrite Content"
echo "D Delete Content"
read -p "Choose Your Option A|B|C|D: " option
case $option in
  A)
    if [ ! -s "abc.txt" ]; then
      echo "It is an empty file"
    else
      echo "The content of the file is:"
      echo "---------------------------"
      cat abc.txt
    fi ;;
  B)
    read -p "Provide your data to append:" data
    echo $data >> abc.txt
    echo "Data Appended" ;;
  C)
    read -p "Provide your data to overwrite:" data
    echo $data > abc.txt
    echo "Old data Overwritten with new data" ;;
  D)
    cat /dev/null > abc.txt
    echo "Deleted the content of the file" ;;
  *) echo "Choose only A|B|C|D. Execute Again" ;;
esac
