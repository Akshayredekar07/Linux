#!/bin/bash

echo "Welcome to DURGA HOTEL"
amount=0

# Menu and Ordering Process
while true
do
  echo "Menu Items:"
  echo "A : Vadapov (Each Plate Rs 30/-)"
  echo "B : Dosa (Each Plate Rs 50/-)"
  echo "C : Poori (Each Plate Rs 40/-)"
  echo "D : Idli (Each Plate Rs 25/-)"

  read -p "Choose Your Required Item (A|B|C|D): " item
  case $item in
    A)
      read -p "Enter the number of plates of Vadapov you need: " quantity
      amount=$((amount + quantity * 30))
      ;;
    B)
      read -p "Enter the number of plates of Dosa you need: " quantity
      amount=$((amount + quantity * 50))
      ;;
    C)
      read -p "Enter the number of plates of Poori you need: " quantity
      amount=$((amount + quantity * 40))
      ;;
    D)
      read -p "Enter the number of plates of Idli you need: " quantity
      amount=$((amount + quantity * 25))
      ;;
    *)
      echo "Invalid option. Please choose again."
      continue
      ;;
  esac

  read -p "Do you want to order another item? (Yes|No): " option
  case $option in
    [Yy]*)
      continue
      ;;
    [Nn]*)
      break
      ;;
    *)
      echo "Invalid option. Exiting."
      break
      ;;
  esac
done

echo
echo "Your Total Bill Amount: Rs $amount/-"
echo "Thanks for visiting DURGA HOTEL!"
