### `until` Loop:

1. **Definition:** The `until` loop executes its body as long as the specified condition is **false**. It stops when the condition becomes **true**.

2. **Syntax:**
   ```bash
   until [ condition ]
   do
     # body of the loop
   done
   ```

3. **Working:**
   - The loop runs **until** the condition becomes true.
   - It is the opposite of the `while` loop, which runs as long as the condition is true.

4. **Use Case:** Suitable when you want to repeat a task until a specific condition is met.

5. **Example:**
   ```bash
   # Script to print numbers from 1 to 5
   i=1
   until [ $i -gt 5 ]
   do
     echo $i
     let i++
   done
   ```
   **Output:**
   ```
   1
   2
   3
   4
   5
   ```

   ### Q1 Script to Print 1 to 5 using `until` Loop:
```bash
#! /bin/bash
i=1
until [ $i -gt 5 ]
do
  echo $i
  let i++
done
```
**Output:**
```
1
2
3
4
5
```

---

### `for` Loop

1. **Definition:** The `for` loop is used to iterate over a list of items, executing the loop body for each item.

2. **Syntax:**
   ```bash
   for variable in item1 item2 item3 ... itemN
   do
     # body of the loop
   done
   ```

3. **Working:**
   - The loop iterates over each item in the list.
   - The `variable` takes the value of each item in each iteration.

4. **Use Case:** Ideal for scenarios where you need to perform operations on multiple items or iterate over a fixed range.

5. **Variations:**
   - **Fixed List:**
     ```bash
     for i in 1 2 3 4 5
     do
       echo $i
     done
     ```
   - **Range Using `{}`:**
     ```bash
     for i in {1..5}
     do
       echo $i
     done
     ```
   - **Files in a Directory:**
     ```bash
     for file in *.txt
     do
       echo "Processing $file"
     done
     ```

6. **Example:**
   ```bash
   # Script to print numbers from 1 to 5
   for i in 1 2 3 4 5
   do
     echo "Current Number: $i"
   done
   ```
   **Output:**
   ```
   Current Number: 1
   Current Number: 2
   Current Number: 3
   Current Number: 4
   Current Number: 5
   ```

### Q2 Script to Display Numbers from 1 to 100 divisible by 10:
```bash
#! /bin/bash
count=0
for num in {1..100}
do
  if [ $((num % 10)) -eq 0 ]; then
    echo "$num"
    let count++
  fi
done
echo "The number of values: $count"
```
**Output:**
```
10
20
30
40
50
60
70
80
90
100
The number of values: 10
```

---

### Q3 Script to Display All File Names in the Current Directory:
```bash
#! /bin/bash
for name in *
do
  if [ -f "$name" ]; then
    echo "$name"
  fi
done
```

---

### Q4 Script to Append Current Date, Time, and Month Calendar to Every `.txt` File:
```bash
#! /bin/bash
for fname in *.txt
do
  date >> "$fname"
  cal >> "$fname"
done
echo "Task Completed"
```

---

### Q5 Script to Print All Command Line Arguments:
```bash
#! /bin/bash
if [ $# -ne 0 ]; then
  count=1
  for arg in "$@"
  do
    echo "Command Line Argument - $count: $arg"
    let count++
  done
else
  echo "Command line arguments are not passed"
fi
```

**Output Examples:**
- If no arguments:
  ```
  Command line arguments are not passed
  ```

- With arguments:
  ```
  ./script.sh 10 20 30
  Command Line Argument - 1: 10
  Command Line Argument - 2: 20
  Command Line Argument - 3: 30
  ```



## Case Study

### Data: `emp.txt`
```
100:durga:1000:Hyderabad
200:bunny:2000:Chennai
300:chinny:3000:Hyderabad
400:vinny:4000:Delhi
500:pinny:5000:Hyderabad
```


### 1. Script to Display all Employees Information where Salary is Greater than 2500
```bash
#! /bin/bash
for record in $(cat emp.txt)
do
  sal=$(echo $record | cut -d ":" -f 3)
  if [ $sal -gt 2500 ]; then
    echo $record
  fi
done
```



### 2. Script to Save all Employees Information where Salary is Greater than 2500 and City is Hyderabad to `hyd.txt`
```bash
#! /bin/bash
for record in $(cat emp.txt)
do
  sal=$(echo $record | cut -d ":" -f 3)
  city=$(echo $record | cut -d ":" -f 4)
  if [ $sal -gt 2500 -a $city = "Hyderabad" ]; then
    echo $record >> hyd.txt
  fi
done
echo "Task Completed"
```


### 3. Script to Display Minimum and Maximum Salaries
```bash
#! /bin/bash
max=$(cat emp.txt | head -1 | cut -d ":" -f 3)
min=$(cat emp.txt | head -1 | cut -d ":" -f 3)
max_record=$(cat emp.txt | head -1)
min_record=$(cat emp.txt | head -1)

for record in $(cat emp.txt)
do
  sal=$(echo $record | cut -d ":" -f 3)
  if [ $sal -gt $max ]; then
    max=$sal
    max_record=$record
  fi
  if [ $sal -lt $min ]; then
    min=$sal
    min_record=$record
  fi
done

echo "The Maximum Salary: $max"
echo "The Maximum Salaried Employee Information:"
echo "Employee No: $(echo $max_record | cut -d ":" -f 1)"
echo "Employee Name: $(echo $max_record | cut -d ":" -f 2)"
echo "Employee Salary: $(echo $max_record | cut -d ":" -f 3)"
echo "Employee Address: $(echo $max_record | cut -d ":" -f 4)"
echo
echo "The Minimum Salary: $min"
echo "The Minimum Salaried Employee Information:"
echo "Employee No: $(echo $min_record | cut -d ":" -f 1)"
echo "Employee Name: $(echo $min_record | cut -d ":" -f 2)"
echo "Employee Salary: $(echo $min_record | cut -d ":" -f 3)"
echo "Employee Address: $(echo $min_record | cut -d ":" -f 4)"
```

_OR_
```shell
#! /bin/bash

# Initialize variables
max=0
min=0
max_record=""
min_record=""

# Read the file line by line
while IFS=":" read -r emp_id name salary city; do
  if [ -z "$max_record" ]; then
    # Initialize with the first record
    max=$salary
    min=$salary
    max_record="$emp_id:$name:$salary:$city"
    min_record="$emp_id:$name:$salary:$city"
  fi

  # Update max record
  if [ "$salary" -gt "$max" ]; then
    max=$salary
    max_record="$emp_id:$name:$salary:$city"
  fi

  # Update min record
  if [ "$salary" -lt "$min" ]; then
    min=$salary
    min_record="$emp_id:$name:$salary:$city"
  fi
done < emp.txt

# Display Maximum Salary Record
echo "===== Maximum Salary ====="
echo "Employee ID   : $(echo $max_record | cut -d ':' -f 1)"
echo "Employee Name : $(echo $max_record | cut -d ':' -f 2)"
echo "Salary        : $(echo $max_record | cut -d ':' -f 3)"
echo "City          : $(echo $max_record | cut -d ':' -f 4)"
echo "=========================="
echo

# Display Minimum Salary Record
echo "===== Minimum Salary ====="
echo "Employee ID   : $(echo $min_record | cut -d ':' -f 1)"
echo "Employee Name : $(echo $min_record | cut -d ':' -f 2)"
echo "Salary        : $(echo $min_record | cut -d ':' -f 3)"
echo "City          : $(echo $min_record | cut -d ':' -f 4)"
echo "=========================="
echo
```

### 4. Script to Display Multiple Files Content to the Terminal and all File Names Passed as Command Line Arguments
```bash
#!/bin/bash

# Check if arguments are passed
if [ $# -eq 0 ]; then
  echo "Error: Please pass at least one file name."
  exit 1
fi

# Process each file passed as an argument
for fname in "$@"; do
  if [ -f "$fname" ]; then
    echo "===== Content of $fname ====="
    cat "$fname"
    echo "============================="
    echo
  else
    echo "Error: '$fname' does not exist or is not a regular file."
  fi
done

```

---

### 5. Script to Append Multiple Files Content to a Single File `result.txt`. File Names are Passed as Command Line Arguments
```bash
#!/bin/bash

# Check if arguments are passed
if [ $# -eq 0 ]; then
  echo "Error: Please pass at least one file name."
  exit 1
fi

# Process each file and append its content to result.txt
for fname in "$@"; do
  if [ -f "$fname" ]; then
    echo "Appending content of '$fname' to result.txt..."
    cat "$fname" >> result.txt
  else
    echo "Error: '$fname' does not exist or is not a regular file."
  fi
done

echo "Task completed. Content appended to result.txt."

```
