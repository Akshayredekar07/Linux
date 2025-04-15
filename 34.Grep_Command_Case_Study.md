

## Print Only Matched Patterns Instead of Total Line  
The `-o` option in the `grep` command prints only the matched patterns instead of the entire line.  

### Example:  
```bash
durgasoft@durgasoft:~/Desktop$ grep c[aeiou]ll demo.txt
call center
cell point
college for unix

durgasoft@durgasoft:~/Desktop$ grep -o c[aeiou]ll demo.txt
call
cell
coll
```

### Explanation:  
- **Without `-o`**: The `grep` command outputs the entire line containing the matching pattern.  
- **With `-o`**: Only the exact matches are printed.

---

**input.txt**
```
Hello this is durga with mobile number 8885252627
Hello this is ravi with mobile number 8096969696
If you required any information call to 9246212143
9927372737 is new mobile number for durgaacademy
```

## Extracting Mobile Numbers Using `grep`  

### Problem:  
Write a `grep` command to extract only mobile numbers from an input file (`input.txt`) and save them to `mobile.txt`.

### Solutions:  

1. **Using Basic `grep`:**  
   This command extracts mobile numbers that start with digits 6 to 9 followed by 9 digits.  
   ```bash
   $ grep -o [6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] input.txt > mobile.txt
   ```

2. **Using `egrep`:**  
   The `{n}` syntax (to specify repetition) is not supported in basic `grep`. Use `egrep` instead.  
   ```bash
   $ egrep -o "[6-9][0-9]{9}" input.txt > mobile.txt
   ```

### Note:  
- **Basic `grep` Limitation:** `{n}` syntax (e.g., `{9}`) is not supported in traditional `grep`.  
- **Using `egrep` or `grep -E`:** Both support extended regular expressions like `{n}`.

---

## Sample Data in `demo.txt`  
```text
call center
cell point
college for unix
extra line 1
extra line2
c[aeiou]ll point for fgrep
```

---

## Practical Commands:

### Match All Patterns with `c[aeiou]ll`:  
```bash
durgasoft@durgasoft:~/Desktop$ grep c[aeiou]ll demo.txt
call center
cell point
college for unix
```

### Print Only Matched Patterns with `-o`:  
```bash
durgasoft@durgasoft:~/Desktop$ grep -o c[aeiou]ll demo.txt
call
cell
coll
```  

### Extract Mobile Numbers and Save to File:  
```bash
# Using basic grep
$ grep -o [6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] input.txt > mobile.txt

# Using egrep or grep -E for extended regex
$ egrep -o "[6-9][0-9]{9}" input.txt > mobile.txt
```

### Verify the Extracted Mobile Numbers:  
```bash
$ cat mobile.txt
```



## Task: Search for a Pattern in Files Inside a Directory and Its Subdirectories  

### Scenario:  
You want to search for mobile numbers (10-digit numbers starting with 6-9) inside multiple files located in various subdirectories under a directory (`resumes`).

---

## Directory Structure:  
```text
resumes/
├── java/
│   └── students.txt
├── python/
│   └── students.txt
└── testing/
    └── students.txt
```

---

## Sample Data in Files:  
### `resumes/java/students.txt`  
```text
Durga 9898989898
Ravi 8096969696
Shiva 9797975656
```

### `resumes/python/students.txt`  
```text
Durga 9898989898
Ravi 8096969696
Shiva 9797975656
```

### `resumes/testing/students.txt`  
```text
Durga 9898989898
Ravi 8096969696
Shiva 9797975656
```

---

## Searching Recursively Using `grep`  

### 1. Attempt Without `-R`:  
Running `egrep` without the `-R` (recursive) option on a directory results in an error:  
```bash
$ egrep "[6-9][0-9]{9}" resumes/
grep: resumes/: Is a directory
```

### 2. Correct Way: Use `-R` Option  
To search recursively in the directory and its subdirectories:  
```bash
$ egrep -R "[6-9][0-9]{9}" resumes/
```

---

## Output:  
The `egrep -R` command outputs the file paths and lines containing matches:  
```text
resumes/python/students.txt:Durga 9898989898
resumes/python/students.txt:Ravi 8096969696
resumes/python/students.txt:Shiva 9797975656
resumes/java/students.txt:Durga 9898989898
resumes/java/students.txt:Ravi 8096969696
resumes/java/students.txt:Shiva 9797975656
resumes/testing/students.txt:Durga 9898989898
resumes/testing/students.txt:Ravi 8096969696
resumes/testing/students.txt:Shiva 9797975656
```

---

## Explanation:  
1. **Recursive Search with `-R`:**  
   - The `-R` option allows `grep` or `egrep` to traverse the directory structure recursively.  
   - It processes all files inside the specified directory and its subdirectories.  

2. **Pattern Matching:**  
   - The regular expression `[6-9][0-9]{9}` matches 10-digit numbers starting with 6-9.  

---

## Key Notes:  
- Use the `-R` option for searching patterns in directories recursively.  
- File paths are included in the output to identify the location of each match.  
- The same technique works for both `grep` and `egrep` (or `grep -E` for extended regular expressions).



#    # Case Study: Learning Recursive `grep` Commands  

You have a directory structure containing various files related to employee records, phone directories, and logs. Your task is to search for specific patterns like mobile numbers, employee IDs, and specific keywords.

---

### Directory Structure  
```text
company/
├── hr/
│   └── employees.txt
├── sales/
│   ├── leads.txt
│   └── clients.txt
└── logs/
    ├── access.log
    └── error.log
```

---

### File Contents  

#### `company/hr/employees.txt`  
```text
John Doe, Employee ID: 101, Mobile: 9876543210
Jane Smith, Employee ID: 102, Mobile: 8765432109
```

#### `company/sales/leads.txt`  
```text
Potential Lead: Mark Johnson, Mobile: 9871234567
Potential Lead: Lisa Ray, Mobile: 8769123456
```

#### `company/sales/clients.txt`  
```text
Client: Alpha Inc., Contact: 9123456789
Client: Beta Ltd., Contact: 8112345678
```

#### `company/logs/access.log`  
```text
2024-11-21 10:45:32: Access from IP 192.168.1.10
2024-11-21 11:02:12: Access from IP 10.0.0.5
```

#### `company/logs/error.log`  
```text
2024-11-21 12:15:22: ERROR: Unable to connect to database
2024-11-21 12:45:45: ERROR: File not found
```

---

## Commands and Operations  

### 1. **Search for Mobile Numbers**  
Search for all mobile numbers (10-digit numbers starting with 6–9) in the directory:  
```bash
$ egrep -R "[6-9][0-9]{9}" company/
```

#### Expected Output:  
```text
company/hr/employees.txt:John Doe, Employee ID: 101, Mobile: 9876543210
company/hr/employees.txt:Jane Smith, Employee ID: 102, Mobile: 8765432109
company/sales/leads.txt:Potential Lead: Mark Johnson, Mobile: 9871234567
company/sales/leads.txt:Potential Lead: Lisa Ray, Mobile: 8769123456
company/sales/clients.txt:Client: Alpha Inc., Contact: 9123456789
company/sales/clients.txt:Client: Beta Ltd., Contact: 8112345678
```

---

### 2. **Search for Employee IDs**  
Extract all lines containing the phrase `Employee ID`:  
```bash
$ grep -R "Employee ID" company/
```

#### Expected Output:  
```text
company/hr/employees.txt:John Doe, Employee ID: 101, Mobile: 9876543210
company/hr/employees.txt:Jane Smith, Employee ID: 102, Mobile: 8765432109
```

---

### 3. **Search for Errors in Log Files**  
Search for all lines containing the keyword `ERROR` in log files:  
```bash
$ grep -R "ERROR" company/logs/
```

#### Expected Output:  
```text
company/logs/error.log:2024-11-21 12:15:22: ERROR: Unable to connect to database
company/logs/error.log:2024-11-21 12:45:45: ERROR: File not found
```

---

### 4. **Search for Specific Access Logs**  
Search for logs containing the IP `192.168.1.10`:  
```bash
$ grep -R "192.168.1.10" company/logs/
```

#### Expected Output:  
```text
company/logs/access.log:2024-11-21 10:45:32: Access from IP 192.168.1.10
```

---

### 5. **Search for Patterns in a Specific Subdirectory**  
Search for mobile numbers only in the `sales` subdirectory:  
```bash
$ egrep -R "[6-9][0-9]{9}" company/sales/
```

#### Expected Output:  
```text
company/sales/leads.txt:Potential Lead: Mark Johnson, Mobile: 9871234567
company/sales/leads.txt:Potential Lead: Lisa Ray, Mobile: 8769123456
company/sales/clients.txt:Client: Alpha Inc., Contact: 9123456789
company/sales/clients.txt:Client: Beta Ltd., Contact: 8112345678
```

---

### 6. **Count the Matches**  
Count the total number of occurrences of mobile numbers in the entire directory:  
```bash
$ egrep -R -o "[6-9][0-9]{9}" company/ | wc -l
```

#### Expected Output:  
```text
6
```

---

### 7. **Save Results to a File**  
Save all extracted mobile numbers to a file `mobiles.txt`:  
```bash
$ egrep -R -o "[6-9][0-9]{9}" company/ > mobiles.txt
```

#### Verify the Results:  
```bash
$ cat mobiles.txt
9876543210
8765432109
9871234567
8769123456
9123456789
8112345678
```

---

### Summary of Commands  

| **Operation**              | **Command**                                             |
|----------------------------|--------------------------------------------------------|
| Search recursively         | `grep -R "pattern" directory/`                         |
| Search for mobile numbers  | `egrep -R "[6-9][0-9]{9}" directory/`                  |
| Search for keywords        | `grep -R "keyword" directory/`                         |
| Count matches              | `egrep -R -o "pattern" directory/ | wc -l`            |
| Save results to a file     | `egrep -R -o "pattern" directory/ > output.txt`        |

This case study provides a hands-on way to learn recursive search commands and understand their practical applications.


**CASE STUDY NO 02**

create the file with the name `server.log` and add the following data inside it
```
2024-11-24 10:23:45 INFO Server started successfully.
2024-11-24 10:25:10 WARN Memory usage exceeded 80%.
2024-11-24 10:27:30 ERROR Failed to connect to database.
2024-11-24 10:30:00 INFO Scheduled backup completed.
2024-11-24 10:35:20 ERROR Disk space critically low.
2024-11-24 10:40:50 INFO User logged in: admin.
2024-11-24 10:45:15 WARN High CPU usage detected.
2024-11-24 10:50:25 INFO [System Shutdown] initiated by admin.
2024-11-24 10:55:05 ERROR Application crash detected.
```
- Here’s a list of all the questions/tasks derived from the case study:
Try to slove it
---

### **Basic Questions**
1. Extract all lines containing the keyword `ERROR` from the log file.  
2. Find all lines with any of the keywords `INFO`, `WARN`, or `ERROR`.  
3. Search for the exact string `[System Shutdown]` in the log file.  

---

### **Intermediate Questions**
4. Display line numbers for all lines containing the keyword `ERROR`.  
5. Perform a case-insensitive search for the keyword `error`.  
6. Display 2 lines before and after each line containing the keyword `ERROR`.  
7. Show all lines that do not contain the keyword `INFO`.  
8. Match only the lines where `ERROR` appears at the beginning of the line.  
9. Count how many times the keyword `WARN` appears in the log file.  
10. Search for `ERROR` messages across multiple `.log` files in the current directory.  
11. Recursively search for `WARN` in all `.log` files, including subdirectories.  
12. Match only the exact word `ERROR` without partial matches like `ERRORS`.  
13. Highlight occurrences of the keyword `ERROR` in the output.  
