
## Advanced for Loop in Bash Scripting

### Old Style of `for` Loop:
```bash
for variable in item1 item2 ... itemN
do
  body
done
```

### Advanced `for` Loop:
```bash
for ((i=1; i<10; i++))
do
  body
done
```

---

## Q1 Script to Print Numbers from 0 to 4 Using Advanced `for` Loop:
```bash
#!/bin/bash
for ((i=0; i<5; i++))
do
  echo $i
done
```

**Output:**
```
0
1
2
3
4
```

---

## Q2 Script to Print Countdown from a Provided Number to 1:
```bash
#!/bin/bash
read -p "Enter n value: " n
for ((i=n; i>=1; i--))
do
  echo $i
  sleep 1.5
done
```

---

## Q3 Script to Display the nth Multiplication Table:
```bash
#!/bin/bash
read -p "Enter n value: " n
for ((i=1; i<=10; i++))
do
  echo "$n * $i = $((n * i))"
done
```

**Example Output:**
```
Enter n value: 9
9 * 1 = 9
9 * 2 = 18
9 * 3 = 27
9 * 4 = 36
9 * 5 = 45
9 * 6 = 54
9 * 7 = 63
9 * 8 = 72
9 * 9 = 81
9 * 10 = 90
```

---

## Q4 Script to Generate a Hotel Bill Based on Customer's Selection:
```bash
#!/bin/bash

echo "Welcome to DURGA HOTEL"
amount=0

while true
do

  echo "Menu Items:"
  echo "A ---> Vadapov (Each Plate Rs 30/-)"
  echo "B ---> Dosa (Each Plate Rs 50/-)"
  echo "C ---> Poori (Each Plate Rs 40/-)"
  echo "D ---> Idli (Each Plate Rs 25/-)"

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

```

**Example Output:**
```
Welcome to DURGA HOTEL
Menu Items:
A ---> Vadapov (Each Plate Rs 30/-)
B ---> Dosa (Each Plate Rs 50/-)
C ---> Poori (Each Plate Rs 40/-)
D ---> Idli (Each Plate Rs 25/-)
Choose Your Required Item (A|B|C|D): D
Enter the number of plates of Idli you need: 4
Do you want to order another item? (Yes|No): Yes
Menu Items:
A ---> Vadapov (Each Plate Rs 30/-)
B ---> Dosa (Each Plate Rs 50/-)
C ---> Poori (Each Plate Rs 40/-)
D ---> Idli (Each Plate Rs 25/-)
Choose Your Required Item (A|B|C|D): C
Enter the number of plates of Poori you need: 3
Do you want to order another item? (Yes|No): No
Your Total Bill Amount: Rs 220/-
Thanks for visiting DURGA HOTEL!
```

---

## Q5 Script to Check Whether a Given Number is Prime:
```bash
#!/bin/bash
read -p "Enter any number to test whether it is prime or not: " n
if [ $n -le 1 ]; then
  echo "$n is not a PRIME number"
  exit 1
fi
for ((i=2; i<=n/2; i++))
do
  if ((n % i == 0)); then
    echo "$n is not a PRIME number"
    exit 1
  fi
done
echo "$n is a PRIME number"
```

**Example Output:**
```
Enter any number to test whether it is prime or not: 23
23 is a PRIME number

Enter any number to test whether it is prime or not: 35
35 is not a PRIME number
```
