
# Operators in Linux

## 1. Arithmetic Operators
- `+` → Addition  
- `-` → Subtraction  
- `*` → Multiplication (use `\*` as `*` is a wildcard character)  
- `/` → Division  
- `%` → Modulo Operator  

## 2. Relational Operators (Numeric Comparison)
- `-gt` → Greater than  
- `-ge` → Greater than or equal to  
- `-lt` → Less than  
- `-le` → Less than or equal to  
- `-eq` → Equal to  
- `-ne` → Not equal to  

> These operators return boolean values (`true/false`).

## 3. Logical Operators
- `-a` → Logical AND  
- `-o` → Logical OR  
- `!` → Logical NOT  

## 4. Assignment Operator
- `=`  

> **Note:**  
> - Except for the assignment operator, spaces are mandatory before and after other operators.

---

## Performing Mathematical Operations in UNIX/Linux

There are multiple ways to perform mathematical operations:

### 1. Using `expr` Keyword
`expr` stands for expression.

```bash
#!/bin/bash
read -p "Enter First Number: " a
read -p "Enter Second Number: " b

sum=`expr $a + $b`
echo "The Sum: $sum"

sum=$(expr $a + $b)
echo "The Sum: $sum"
```

**Notes:**
- `$` symbol is mandatory.
- Space is required before and after the `+` symbol.

### 2. Using `let` Keyword
```bash
let sum=a+b
echo "The Sum: $sum"

let sum=$a+$b
echo "The Sum: $sum"
```

**Notes:**
- `$` symbol is optional.
- Do not use spaces before and after the `+`.

### 3. Using `(())`
```bash
sum=$((a+b))
echo "The Sum: $sum"

sum=$(($a+$b))
echo "The Sum: $sum"
```

**Notes:**
- Space and `$` symbol are optional.

### 4. Using `[]`
```bash
sum=$[a+b]
echo "The Sum: $sum"

sum=$[$a+$b]
echo "The Sum: $sum"
```

**Notes:**
- Space and `$` symbol are optional.

---

## Floating-Point Arithmetic with `bc`

`bc` (Binary Calculator) is used to perform both integer and floating-point arithmetic. Start `bc` by typing `bc` in the terminal:

```bash
durgasoft@durgasoft:~/scripts$ bc
bc 1.07.1
10.5+30.6
41.1
10.2^2
104.0
10.5*3.6
37.8
ctrl+d  # Exit bc
```

### Script for Floating-Point Arithmetic
```bash
#!/bin/bash
read -p "Enter First Number: " a
read -p "Enter Second Number: " b

sum=$(echo $a+$b | bc)
echo "The Sum: $sum"

echo "The Difference: $(echo $a-$b | bc)"
echo "The Product: $(echo $a*$b | bc)"
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh
Enter First Number: 10.5
Enter Second Number: 5.3
The Sum: 15.8
The Difference: 5.2
The Product: 55.6
```

---

## Examples and Exercises

### Q1: Write a Script to Read Two Integer Numbers and Print Their Sum
```bash
#!/bin/bash
read -p "Enter First Number: " a
read -p "Enter Second Number: " b
sum=$[a+b]
echo "The Sum: $sum"
```

---

### Q2: Write a Script to Read a 4-Digit Integer and Print the Sum of Its Digits
```bash
#!/bin/bash
read -p "Enter Any 4-Digit Integer Number: " n

a=$(echo $n | cut -c 1)
b=$(echo $n | cut -c 2)
c=$(echo $n | cut -c 3)
d=$(echo $n | cut -c 4)

echo "The Sum of 4 Digits: $[a+b+c+d]"
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh
Enter Any 4-Digit Integer Number: 1234
The Sum of 4 Digits: 10

durgasoft@durgasoft:~/scripts$ ./test.sh
Enter Any 4-Digit Integer Number: 3456
The Sum of 4 Digits: 18
```

---

### Q3: Write a Script to Calculate Bonus as 25% of Annual Salary
```bash
#!/bin/bash
read -p "Enter Employee Monthly Salary: " salary

annual_salary=$[salary*12]
bonus=$[annual_salary*25/100]

echo "The Bonus: $bonus"
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ ./test.sh
Enter Employee Monthly Salary: 10000
The Bonus: 30000
```
