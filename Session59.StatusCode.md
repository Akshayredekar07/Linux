
## **Exit Codes/Status Codes**

- Every command and script return a value after execution to indicate whether it executed successfully or not. This return value is called an **exit code** or **status code**.  
- We can find the exit code of the last executed command using `$?`.

| **Exit Code** | **Meaning**                                  |
|---------------|----------------------------------------------|
| **0**         | Command/script executed successfully.        |
| **Non-zero**  | Command/script did not execute successfully. |

### Example:
```bash
durgasoft@durgasoft:~/scripts$ echo "Hello Friends"
Hello Friends
durgasoft@durgasoft:~/scripts$ echo "$?"
0
```

```bash
durgasoft@durgasoft:~/scripts$ rm sdfjkslajfdksajfjdsakjfdksajfkd
rm: cannot remove 'sdfjkslajfdksajfjdsakjfdksajfkd': No such file or directory
durgasoft@durgasoft:~/scripts$ echo "$?"
1
```

---

### **`exit` Command**
- The `exit` command stops script execution.
- **Syntax:**  
  ```bash
  exit status_code
  ```
  The allowed values for `status_code` are `0 to 255`.  
  Numbers beyond 255 will wrap around (e.g., `256 → 0`, `257 → 1`, etc.).

---

### **Q5) Write a Script to Calculate Sum of Two Integers**

**Script (`test.sh`):**
```bash
#! /bin/bash
if [ $# -ne 2 ]; then
  echo "You should provide exactly two arguments"
  exit 1
fi

x=$1
y=$2
sum=$(expr $x + $y)

if [ $? -ne 0 ]; then
  echo "You should provide integer numbers only"
  exit 2
else
  echo "The Sum: $sum"
fi
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh 10 20
The Sum: 30

durgasoft@durgasoft:~/scripts$ test.sh
You should provide exactly two arguments

durgasoft@durgasoft:~/scripts$ test.sh 10
You should provide exactly two arguments

durgasoft@durgasoft:~/scripts$ test.sh 10 durga
expr: non-integer argument
You should provide integer numbers only
```

---

### **Q6) Check if a Number is Positive or Negative**

**Script:**
```bash
#! /bin/bash
read -p "Enter integer number to check: " n
if [ $n -gt 0 ]; then
  echo "$n is a positive number"
else
  echo "$n is a negative number"
fi
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: 10
10 is a positive number

durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: -10
-10 is a negative number
```

---

### **Q7) Check if a Number is Even or Odd**

**Script:**
```bash
#! /bin/bash
read -p "Enter integer number to check: " n
if [ $((n % 2)) -eq 0 ]; then
  echo "$n is an even number"
else
  echo "$n is an odd number"
fi
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: 10
10 is an even number

durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: 15
15 is an odd number
```

---

### **Q8) Check if a Number is a 3-Digit Number**

**Script:**
```bash
#! /bin/bash
read -p "Enter integer number to check: " n
if [ $n -ge 100 -a $n -le 999 ]; then
  echo "$n is a 3-digit number"
else
  echo "$n is not a 3-digit number"
fi
```

**Output:**
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: 123
123 is a 3-digit number

durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: 45
45 is not a 3-digit number

durgasoft@durgasoft:~/scripts$ test.sh
Enter integer number to check: 1234
1234 is not a 3-digit number
``` 
