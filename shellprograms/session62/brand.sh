#! /bin/bash
read -p "Enter Your Favourite Brand: " brand
case $brand in
  "KF") echo "It is children's brand" ;;
  "KO") echo "It is not that much kick" ;;
  "RC") echo "It is too light" ;;
  "FO") echo "Buy one get one FREE" ;;
  *) echo "Other brands are not recommended" ;;
esac
