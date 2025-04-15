

## Iterative Statements in Shell Scripting

If we want to execute a group of commands multiple times, we should use iterative statements. There are 3 types of iterative statements in shell scripting:

1. **`while` loop**
2. **`until` loop**
3. **`for` loop**



## 1 **`while` Loop**
If we don't know the number of iterations in advance, we use the `while` loop.

### Syntax:
```bash
while [ condition ]
do
  body
done
```
As long as the condition is true, the body will execute. Once the condition fails, the loop terminates.



### Example 1: Print Numbers from 1 to 10
```bash
#!/bin/bash
i=1
while [ $i -le 10 ]
do
  echo $i
  let i++
done
```


### Example 2: Generate Numbers Until Limit Provided by User
```bash
#!/bin/bash
read -p "Enter Limit: " n
i=1
while [ $i -le $n ]
do
  echo $i
  sleep 2
  let i++
done
```
**Note:** The `sleep` command pauses execution for the specified number of seconds. Examples:
- `sleep 2` → Pause for 2 seconds  
- `sleep 0.5` → Pause for 0.5 seconds  


### Example 3: Find the Sum of First `n` Integers (User Input)
```bash
#!/bin/bash
read -p "Enter n value: " n
i=1
sum=0
while [ $i -le $n ]
do
  let sum=sum+i
  let i++
done
echo "The Sum of first $n numbers: $sum"
```
#### Output:
1. Input: `3`  
   Output: `The Sum of first 3 numbers: 6`
2. Input: `10`  
   Output: `The Sum of first 10 numbers: 55`


### Example 4: Display a Digital Timer
```bash
#!/bin/bash
while [ true ]
do
  clear
  printf "\n\n\n\n\n\n\t\t\t\t$(date +%H:%M:%S)"
  sleep 1
done
```

**Note:**
- Use the `printf` command instead of `echo` for escape characters like `\n` and `\t`.
- The `true` keyword represents an infinite loop as the condition always evaluates to `true`.


### Concepts Summary:
- **`sleep` Command:** Pauses execution for a given time in seconds.
- **Escape Characters:**  
  - `\n`: New line  
  - `\t`: Tab  
- **Keywords:**  
  - `true`: Represents a boolean value that keeps the loop running indefinitely.  
  - `false`: Represents a boolean value that exits the loop immediately.


---

### Example 1: **Checking Server Status Continuously**
This script continuously checks if a server is reachable.

```bash
#!/bin/bash
while [ true ]
do
  ping -c 1 example.com > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Server is up"
  else
    echo "Server is down"
  fi
  sleep 5
done
```
**Use Case:** Monitor server uptime in real-time.


### Example 2: **Backup Files Periodically**
This script creates backups of a directory every 10 seconds.

```bash
#!/bin/bash
source_dir="/path/to/source"
backup_dir="/path/to/backup"

while [ true ]
do
  timestamp=$(date +%Y%m%d%H%M%S)
  cp -r $source_dir "$backup_dir/backup_$timestamp"
  echo "Backup created at $timestamp"
  sleep 10
done
```
**Use Case:** Automating periodic backups.


### Example 3: **Monitoring Disk Space**
This script monitors disk space usage and alerts when it exceeds a threshold.

```bash
#!/bin/bash
threshold=90

while [ true ]
do
  usage=$(df / | grep '/' | awk '{print $5}' | sed 's/%//')
  if [ $usage -gt $threshold ]; then
    echo "Disk usage is above $threshold%: Current usage is $usage%"
  fi
  sleep 30
done
```
**Use Case:** Preventing disk space issues on servers.


### Example 4: **Downloading Files in Chunks**
This script downloads a file in chunks until the download is complete.

```bash
#!/bin/bash
file_url="https://example.com/largefile.zip"
output_file="largefile.zip"

while [ ! -f "$output_file" ]
do
  wget -c $file_url -O $output_file
  if [ $? -eq 0 ]; then
    echo "Download complete."
    break
  else
    echo "Retrying download..."
  fi
  sleep 5
done
```
**Use Case:** Handling unreliable network connections during downloads.


### Example 5: **User Authentication Retry**
This script prompts for a password and allows three attempts for correct input.

```bash
#!/bin/bash
correct_password="secret123"
attempts=0
max_attempts=3

while [ $attempts -lt $max_attempts ]
do
  read -sp "Enter your password: " password
  echo
  if [ "$password" == "$correct_password" ]; then
    echo "Access granted."
    break
  else
    echo "Incorrect password."
    attempts=$((attempts + 1))
  fi
done

if [ $attempts -eq $max_attempts ]; then
  echo "Access denied. Too many failed attempts."
fi
```
**Use Case:** Login system with retry limits.

