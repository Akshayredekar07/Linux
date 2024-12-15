
**Command Line Arguments**

The arguments which are passed from the command prompt at the time of executing a script are called command line arguments.

Example:
```bash
$ ./test.sh learning linux is very easy
```
The command line arguments are: `learning`, `linux`, `is`, `very`, `easy`.

Inside the script, we can access command line arguments as follows:

- **$#** → Number of Arguments (5)
- **$0** → Script Name (`./test.sh`)
- **$1** → 1st Argument (`learning`)
- **$2** → 2nd Argument (`linux`)
- **$3** → 3rd Argument (`is`)
- **$4** → 4th Argument (`very`)
- **$5** → 5th Argument (`easy`)
- **$*** → All Arguments (`learning linux is very easy`)
- **$@** → All Arguments (`learning linux is very easy`)
- **$?** → Represents exit code of previously executed command or script.

Example script `test.sh`:
```bash
#! /bin/bash
echo "Number of arguments: $#"
echo "Script Name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Third argument: $3"
echo "Fourth argument: $4"
echo "Fifth argument: $5"
echo "Total arguments: $*"
```

Output when executed:
```bash
$ ./test.sh learning linux is very easy
Number of arguments: 5
Script Name: ./test.sh
First argument: learning
Second argument: linux
Third argument: is
Fourth argument: very
Fifth argument: easy
Total arguments: learning linux is very easy
```

**Difference between $@ and $***:
- **$@** → All command line arguments with space separator (`"$1" "$2" "$3" ...`)
- **$*** → All command line arguments as a single string (`"$1c$2c$3c..."`), where `c` is the first character of the Internal Field Separator (IFS). By default, `IFS` is a space.

To check the default `IFS`:
```bash
$ set | grep "IFS"
IFS=$' \t\n'
```

To change `IFS`:
```bash
#! /bin/bash
IFS="-"
echo "Number of arguments: $#"
echo "Script Name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "Third argument: $3"
echo "Fourth argument: $4"
echo "Fifth argument: $5"
echo "Total arguments: $@"
echo "Total arguments: $*"
```

Output after changing `IFS`:
```bash
$ test.sh learning unix is very easy
Number of arguments: 5
Script Name: /home/durgasoft/scripts/test.sh
First argument: learning
Second argument: unix
Third argument: is
Fourth argument: very
Fifth argument: easy
Total arguments: learning unix is very easy
Total arguments: learning-unix-is-very-easy
```

**Note**: The main purpose of command line arguments is to customize the behavior of the script.

**Example Scripts**:

1. **Script to Calculate String Length**:
   ```bash
   #! /bin/bash
   l=$(echo -n "DURGA" | wc -c)
   echo "The Length of given String: $l"
   ```
   This script will work only for the string `DURGA`.

   **Generic Version**:
   ```bash
   #! /bin/bash
   len=$(echo -n "$1" | wc -c)
   echo "The Length of given string $1 : $len"
   ```
   This script will work for any string provided from the command prompt.

   Example usage:
   ```bash
   $ test.sh
   The Length of given string : 0

   $ test.sh durgasoft
   The Length of given durgasoft : 9

   $ test.sh adsfkjshfdjkhsfkjhkjsfhk
   The Length of given string adsfkjshfdjkhsfkjhkjsfhk : 24
   ```

2. **Script to Create Log File with Timestamp**:
   ```bash
   #! /bin/bash
   timestamp=$(date +%d_%m_%Y_%H_%M_%S)
   echo "This is data to log file" >> ${timestamp}.log
   echo "This is extra data to log file" >> ${timestamp}.log
   date >> ${timestamp}.log
   echo >> ${timestamp}.log
   echo "Data Written to log file successfully"
   ```
   This script will create a new log file each time it is executed, with the timestamp reflecting the exact second it was run.

   To create a log file for every minute:
   ```bash
   timestamp=$(date +%d_%m_%Y_%H_%M)
   ```

   For a new log file every hour:
   ```bash
   timestamp=$(date +%d_%m_%Y_%H)
   ```

   For a new log file every day:
   ```bash
   timestamp=$(date +%d_%m_%Y)
   ``` 

---

### **Case Study: Automation with Command Line Arguments**

#### **Scenario:**  
A mid-sized IT company wants to automate routine tasks for developers and system administrators. One of the key challenges is maintaining logs and processing user data dynamically without modifying scripts frequently. They decide to leverage command line arguments in their Bash scripts to make them more versatile and reusable.

---

### **Problem Statement:**  
The company frequently encounters issues with:  
1. Generating logs dynamically with unique names.  
2. Processing data provided by developers without manual intervention.  
3. Running diagnostic scripts where input parameters (like file paths or keywords) vary for each execution.  

Manually editing scripts for different use cases is time-consuming and error-prone.

---

### **Solution:**  
Implementing command line arguments to allow flexible and user-defined input for scripts.

---

### **Implementation:**

#### **1. Dynamic Log File Generation:**  
The company needs a log file to be created with a timestamp in its name whenever an event occurs.  

**Script:**  
```bash
#! /bin/bash
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
logfile="${1}_${timestamp}.log"  # First argument specifies the log file prefix
echo "Event: $2" >> "$logfile"  # Second argument specifies the event description
echo "Log file created: $logfile"
```

**Execution:**  
```bash
$ ./log_generator.sh SystemCheck "CPU usage exceeds threshold"
```  
**Output:**  
- Log file: `SystemCheck_2024-12-15_14-30-00.log`  
- Content: `Event: CPU usage exceeds threshold`

---

#### **2. User Input for String Length Calculation:**  
Developers need to calculate string lengths dynamically for different inputs.  

**Script:**  
```bash
#! /bin/bash
input_string="$1"
length=$(echo -n "$input_string" | wc -c)
echo "The length of '$input_string' is: $length"
```

**Execution:**  
```bash
$ ./string_length.sh "Hello, Automation!"
```  
**Output:**  
`The length of 'Hello, Automation!' is: 18`

---

#### **3. Batch File Processing:**  
System administrators need to process a batch of files provided as arguments.  

**Script:**  
```bash
#! /bin/bash
echo "Processing files..."
for file in "$@"; do
    if [[ -f $file ]]; then
        echo "File: $file exists and is being processed."
        # Simulate processing
        sleep 1
    else
        echo "Error: File $file does not exist!"
    fi
done
```

**Execution:**  
```bash
$ ./file_processor.sh file1.txt file2.txt file3.txt
```  
**Output:**  
- `File: file1.txt exists and is being processed.`  
- `Error: File file2.txt does not exist!`  
- `File: file3.txt exists and is being processed.`

---

### **Benefits:**

1. **Flexibility:** Scripts are reusable without modification for various inputs.
2. **Efficiency:** Tasks like log creation and data processing are automated with minimal user intervention.
3. **Error Reduction:** User inputs ensure that variables and data are dynamically handled, reducing hardcoding errors.

---


### Difference Between `>` and `>>` in Shell Scripting

- **`>` Operator**: Overwrites the existing content of the file.  
  Example:  
  ```bash
  echo "Hello" > abc.txt
  ```
  **Effect**: This will overwrite any existing data in `abc.txt` with the string `Hello`.

- **`>>` Operator**: Appends new content to the existing file without overwriting.  
  Example:  
  ```bash
  echo "Hello" >> abc.txt
  ```
  **Effect**: This will add the string `Hello` to the end of `abc.txt`, preserving the existing content.
