**Variable Substitution and Command Substitution**


**Variable Substitution**  
- **Definition**: Accessing the value of a variable using the `$` symbol is called variable substitution.  
- **Syntax**:  
  ```bash
  $variablename  
  ${variablename}  
  ```
  It is recommended to use `${variablename}` for clarity, especially in cases where additional text is appended to the variable value.

**Example Script (test.sh)**:  
```bash
#! /bin/bash
a=10
b=20
COURSE="linux"
ACTION="SLEEP"
echo "Values of a and b are: $a and $b"
echo "My Course is: ${COURSE}"
echo "My Favourite Action: $ACTIONING"
echo "My Favourite Action: ${ACTION}ING"
```

**Output**:  
```
Values of a and b are: 10 and 20  
My Course is: linux  
My Favourite Action:  
My Favourite Action: SLEEPING  
```

**Explanation**:  
- `$ACTIONING` does not substitute because there is no variable `ACTIONING`.  
- `${ACTION}ING` appends `ING` to the value of `ACTION`, resulting in `SLEEPING`.

**Key Notes**:  
1. Using **single quotes (`'`)** prevents variable substitution.  
2. Using **double quotes (`"`)** allows variable substitution.  

**Example**:  
```bash
NAME="durga"

echo NAME         # Output: NAME
echo $NAME        # Output: durga
echo '$NAME'      # Output: $NAME
echo "$NAME"      # Output: durga
```

**Quiz**:  
Q: Consider the variable declaration `NAME="durga"`. Which of the following prints the value of `NAME`?  
A) `echo NAME`  
B) `echo $NAME`  
C) `echo '$NAME'`  
D) `echo "$NAME"`  
**Answer**: B, D  



**Command Substitution**  
- **Definition**: Execute a command and substitute its result within a script or command.  
- **Syntax**:  
  - Old style: `` `command` `` (backticks, not single quotes).  
  - New style: `$(command)` (recommended for readability).  

**Examples**:  

1. **Getting the current date**:  
   ```bash
   echo "Today Date is: `date +%D`"
   echo "Today Date is: $(date +%D)"
   ```
   **Output**:  
   ```
   Today Date is: 12/06/19
   Today Date is: 12/06/19
   ```

2. **Counting files in the current directory**:  
   ```bash
   echo "Number of files in Current Working Directory: `ls | wc -l`"
   echo "Number of files in Current Working Directory: $(ls | wc -l)"
   ```
   **Output**:  
   ```
   Number of files in Current Working Directory: 5
   Number of files in Current Working Directory: 5
   ```

3. **Counting lines in a file (`test.sh`)**:  
   ```bash
   echo "The No of Lines in test.sh: `cat test.sh | wc -l`"
   echo "The No of Lines in test.sh: $(wc -l test.sh)"
   ```
   **Output**:  
   ```
   The No of Lines in test.sh: 9
   The No of Lines in test.sh: 9 test.sh
   ```

4. **Getting the current working directory**:  
   ```bash
   echo "My Current Working Directory: `pwd`"
   echo "My Current Working Directory: $(pwd)"
   ```
   **Output**:  
   ```
   My Current Working Directory: /home/durgasoft/scripts
   My Current Working Directory: /home/durgasoft/scripts
   ```


**Comparison of Substitutions**

| **Type**                 | **Definition**                                                                 | **Syntax**                     | **Example**                       | **Output**                        |
|--------------------------|-------------------------------------------------------------------------------|--------------------------------|-----------------------------------|-----------------------------------|
| **Variable Substitution** | Replaces variable name with its value                                         | `$variablename` or `${variablename}` | `echo $NAME` or `echo ${NAME}`   | Prints the value of `NAME`.      |
| **Command Substitution**  | Replaces command with the result of its execution                             | `` `command` `` or `$(command)` | `echo $(date)` or ``echo `date` `` | Prints the output of the command.|


**Case Study: Automating a System Monitoring Report Using Variable and Command Substitution**


**Scenario**:  
A company wants to generate a system monitoring report automatically and display the following details using a shell script:  
1. Current Date and Time.  
2. Logged-in User's Name.  
3. Current Working Directory.  
4. Total Number of Files in the Current Directory.  
5. Free Disk Space.  

The script should utilize **Variable Substitution** and **Command Substitution** to display this information dynamically.


**Script: system_report.sh**  
```bash
#!/bin/bash

# Using Command Substitution to retrieve dynamic information
CURRENT_DATE=$(date '+%Y-%m-%d %H:%M:%S')
LOGGED_USER=$USER
WORKING_DIRECTORY=$(pwd)
TOTAL_FILES=$(ls | wc -l)
DISK_SPACE=$(df -h / | grep '/' | awk '{print $4}')

# Displaying the report using Variable Substitution
echo "-----------------------------------"
echo "       System Monitoring Report    "
echo "-----------------------------------"
echo "Date and Time          : $CURRENT_DATE"
echo "Logged-in User         : ${LOGGED_USER}"
echo "Current Working Directory : ${WORKING_DIRECTORY}"
echo "Total Number of Files  : ${TOTAL_FILES}"
echo "Available Disk Space   : ${DISK_SPACE}"
echo "-----------------------------------"
```


**Explanation**:  
1. **Variable Substitution**:
   - `$LOGGED_USER`, `${WORKING_DIRECTORY}`, `${TOTAL_FILES}`, and `${DISK_SPACE}` are used to substitute the values stored in variables.

2. **Command Substitution**:
   - `$(date '+%Y-%m-%d %H:%M:%S')`: Fetches the current date and time.  
   - `$(pwd)`: Retrieves the current working directory.  
   - `$(ls | wc -l)`: Counts the total number of files in the directory.  
   - `$(df -h / | grep '/' | awk '{print $4}')`: Fetches the free disk space of the root partition.



**Key Learning Points**:  
1. **Dynamic Command Execution**: Using command substitution ensures that the script fetches the latest system information each time it runs.  
2. **Readable Outputs**: Variable substitution provides clear and formatted results, making the script output user-friendly.  
3. **Reusable Code**: The use of variables like `CURRENT_DATE` and `DISK_SPACE` makes the script easy to maintain and modify.  

---

**Case Study: Backup Automation Script Using Variable and Command Substitution**


**Scenario**:  
An organization needs to back up important files daily to a specific directory with the current date in the backup folder name. The backup process should:  
1. Create a directory named `backup_<date>`.  
2. Copy all `.txt` files from a source directory to the backup directory.  
3. Generate a log file containing the list of backed-up files.  
4. Provide a summary at the end, including the total number of files backed up and the destination path.



**Script: backup.sh**  
```bash
#!/bin/bash

# Variables and Command Substitution
SOURCE_DIR="/home/akshay/Desktop/operations/session54"
BACKUP_DIR="/home/akshay/Desktop/operations/session54"
CURRENT_DATE=$(date '+%Y-%m-%d')
BACKUP_FOLDER="${BACKUP_DIR}/backup_${CURRENT_DATE}"
LOG_FILE="${BACKUP_FOLDER}/backup_log.txt"

# Create the backup folder
mkdir -p "${BACKUP_FOLDER}"

# Start the log file
echo "Backup Log - Date: ${CURRENT_DATE}" > "${LOG_FILE}"
echo "-----------------------------------" >> "${LOG_FILE}"

# Copy .txt files to the backup folder and log their names
cp "${SOURCE_DIR}"/*.txt "${BACKUP_FOLDER}" 2>/dev/null && ls "${BACKUP_FOLDER}"/*.txt >> "${LOG_FILE}"

# Count the number of files backed up
TOTAL_FILES=$(ls "${BACKUP_FOLDER}"/*.txt 2>/dev/null | wc -l)

# Display summary
echo "-----------------------------------"
echo "         Backup Summary            "
echo "-----------------------------------"
echo "Date of Backup        : ${CURRENT_DATE}"
echo "Source Directory      : ${SOURCE_DIR}"
echo "Backup Directory      : ${BACKUP_FOLDER}"
echo "Total Files Backed Up : ${TOTAL_FILES}"
echo "Log File              : ${LOG_FILE}"
echo "-----------------------------------"

# Handle case of no files to backup
if [ "${TOTAL_FILES}" -eq 0 ]; then
    echo "No '.txt' files found in the source directory. Backup skipped."
    rm -rf "${BACKUP_FOLDER}"
else
    echo "Backup completed successfully! Check the log file for details."
fi
```


**Explanation**:  
1. **Variable Substitution**:  
   - `${SOURCE_DIR}`, `${BACKUP_DIR}`, `${CURRENT_DATE}`, `${BACKUP_FOLDER}`, and `${LOG_FILE}` hold the source, destination, date, and log paths, respectively.  
   - `${TOTAL_FILES}` is used to count and display the number of files backed up.

2. **Command Substitution**:  
   - `$(date '+%Y-%m-%d')`: Gets the current date for naming the backup folder.  
   - `$(ls "${BACKUP_FOLDER}"/*.txt | wc -l)`: Counts the number of `.txt` files in the backup directory.  

3. **Conditional Logic**:  
   - If no `.txt` files are found, the backup folder is removed, and the user is notified.



**Key Learning Points**:  
1. **Dynamic Folder Names**: Using command substitution ensures each backup has a unique name with the current date.  
2. **Logging and Debugging**: The log file records all backed-up files, which helps with future auditing and debugging.  
3. **Error Handling**: The script gracefully handles cases where there are no files to back up.  
4. **Automating Repetitive Tasks**: By integrating command and variable substitution, repetitive tasks like backups can be automated efficiently.  
