

## Project 2: Book Rental Application

The DURGASOFT Book Company needs a way to calculate the cost that a student pays for renting a book. The cost depends on the time the book is returned, and there are special rates for weekends.



### Fee Structure:
1. The cost is Rs. 30/- per day.
2. If the book is returned **after 9 PM**, the student will be charged for an extra day.
3. If the book is rented on a **Sunday**, the student gets a **50% discount** for the entire rental period.
4. If the book is rented on a **Saturday**, the student gets a **30% discount** for the entire rental period.



## Version-1 (Manual Input for Return Time)

```bash
#! /bin/bash
echo "Welcome to DURGASOFT BOOK RENTAL APPLICATION"
echo "############################################"

cost_per_day=30

read -p "Was Book returned before 9 PM [Yes|No]:" ontime
read -p "How many days was Book Rented:" days_rented
read -p "What day the Book rented:" day_rented

if [ $ontime = "No" ]; then
    days_rented=$((days_rented + 1))
fi

if [ $day_rented = "Sunday" ]; then
    cost=$(echo "$days_rented * $cost_per_day * 0.5" | bc)
elif [ $day_rented = "Saturday" ]; then
    cost=$(echo "$days_rented * $cost_per_day * 0.7" | bc)
else
    cost=$(echo "$days_rented * $cost_per_day" | bc)
fi

echo "The Cost Of Book Rental: Rs $cost"

original_cost=$((days_rented * cost_per_day))
discountF=$(echo "$original_cost - $cost" | bc)
discountI=$(echo "$discountF" | cut -d "." -f1)

if [ $discountI -gt 0 ]; then
    echo "Hello, You got Rs $discountF Discount, Enjoy.."
fi

echo "Visit Again..."
```



## Version-2 (Automatic Return Time Check)

```bash
#! /bin/bash
echo "Welcome to DURGASOFT BOOK RENTAL APPLICATION"
echo "############################################"

cost_per_day=30

read -p "How many days was Book Rented:" days_rented
read -p "What day the Book rented:" day_rented

# Check system time for return
h=$(date +%H)
if [ $h -ge 21 ]; then
    days_rented=$((days_rented + 1))
fi

if [ $day_rented = "Sunday" ]; then
    cost=$(echo "$days_rented * $cost_per_day * 0.5" | bc)
elif [ $day_rented = "Saturday" ]; then
    cost=$(echo "$days_rented * $cost_per_day * 0.7" | bc)
else
    cost=$(echo "$days_rented * $cost_per_day" | bc)
fi

echo "The Cost Of Book Rental: Rs $cost"

original_cost=$((days_rented * cost_per_day))
discountF=$(echo "$original_cost - $cost" | bc)
discountI=$(echo "$discountF" | cut -d "." -f1)

if [ $discountI -gt 0 ]; then
    echo "Hello, You got Rs $discountF Discount, Enjoy.."
fi

echo "Visit Again..."
```



### Output Examples:

#### **Scenario 1**: Sunday Rental  
```bash
durga@durga-VirtualBox:~/scripts$ test.sh
Welcome to DURGASOFT BOOK RENTAL APPLICATION
############################################
Was Book returned before 9 PM [Yes|No]:Yes
How many days was Book Rented:4
What day the Book rented:Sunday
The Cost Of Book Rental: Rs 60.0
Hello, You got Rs 60.0 Discount, Enjoy..
Visit Again...
```

#### **Scenario 2**: Saturday Rental  
```bash
durga@durga-VirtualBox:~/scripts$ test.sh
Welcome to DURGASOFT BOOK RENTAL APPLICATION
############################################
Was Book returned before 9 PM [Yes|No]:Yes
How many days was Book Rented:6
What day the Book rented:Saturday
The Cost Of Book Rental: Rs 126.0
Hello, You got Rs 54.0 Discount, Enjoy..
Visit Again...
```

#### **Scenario 3**: Late Return on Monday  
```bash
durga@durga-VirtualBox:~/scripts$ test.sh
Welcome to DURGASOFT BOOK RENTAL APPLICATION
############################################
Was Book returned before 9 PM [Yes|No]:No
How many days was Book Rented:6
What day the Book rented:Monday
The Cost Of Book Rental: Rs 210
Visit Again..
```
