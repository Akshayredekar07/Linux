### 10. Replacing Data Present in the File:

We use the `s` option for substitution.

#### 1. Replace All Occurrences:
```bash
$ sed 's/durga/linux/g' demo.txt
```
- It will replace all occurrences of "durga" with "linux" while displaying content without modifying the file.

#### 2. Replace Only First Occurrence in Every Line:
```bash
$ sed 's/durga/linux/' demo.txt
```
- Replaces only the first occurrence of "durga" in every line.

#### 3. Replace and Ignore Case:
```bash
$ sed 's/DURGA/linux/gi' demo.txt
```
- Replaces "DURGA" with "linux" and ignores case sensitivity.

#### 4. Replace Permanently in the File:
```bash
$ sed -i 's/DURGA/linux/gi' demo.txt
```
- Replaces "DURGA" with "linux" in the file permanently.

#### 5. Replace Blank Lines with Text:
```bash
$ sed -i 's/^$/I Like durga/g' demo.txt
```
- Replaces every blank line with "I Like Sunny".

#### 6. Delete Specific Words or Patterns:
```bash
$ sed -i 's/\<durga\>//gi' demo.txt
```
- Deletes every occurrence of "sunny" in the file, ignoring case.

#### 7. Delete 3-Digit Words:
```bash
$ sed -i 's/\<[0-9][0-9][0-9]\>//g' demo.txt
```
- Deletes all 3-digit words from the file.

```bash
sed -i 's/linux soft/durga soft/gi' demo.txt
```

---


The stream editor (`sed`) is a powerful text-processing tool often used for modifying text streams. Below, I'll provide an overview of common `sed` commands and demonstrate their usage with a case study.

---

### Common `sed` Commands

1. **Substitution (`s`)**
   - Syntax: `s/old/new/flags`
   - Flags:  
     - `g`: Replace all occurrences in a line.
     - `i`: Case-insensitive matching.
     - `n`: Replace the nth occurrence.

2. **Delete (`d`)**
   - Deletes lines matching a pattern.

3. **Print (`p`)**
   - Prints lines matching a pattern.

4. **Append/Insert (`a`, `i`)**
   - `a`: Appends text after the current line.
   - `i`: Inserts text before the current line.

5. **Replace Line (`c`)**
   - Replaces the entire line matching a pattern.

6. **Transform (`y`)**
   - Transforms characters in a 1:1 mapping (like `tr`).

7. **Read/Write (`r`, `w`)**
   - `r`: Reads from a file and appends it.
   - `w`: Writes matched lines to a file.

8. **Hold Space Commands**
   - `h`, `H`, `g`, `G`, `x`: Used for advanced processing by saving/retrieving patterns.

---

### Case Study: Processing a Log File

#### **Scenario**  
You have a server log file `server.log` with the following content:

```
INFO: Server started at 10:00
ERROR: Connection failed
WARNING: High memory usage
INFO: Backup completed at 12:00
ERROR: Disk space low
INFO: Shutdown initiated
```

#### **Task 1: Extract All `ERROR` Lines**  
Command:  
```bash
sed -n '/ERROR/p' server.log
```

**Explanation**:  
- `-n`: Suppresses automatic printing.  
- `/ERROR/`: Matches lines containing `ERROR`.  
- `p`: Prints matched lines.

---

#### **Task 2: Replace `ERROR` with `ALERT`**  
Command:  
```bash
sed 's/ERROR/ALERT/g' server.log
```

**Explanation**:  
- `s/ERROR/ALERT/`: Substitutes `ERROR` with `ALERT`.  
- `g`: Replaces all occurrences in a line.

---

#### **Task 3: Delete All `INFO` Lines**  
Command:  
```bash
sed '/INFO/d' server.log
```

**Explanation**:  
- `/INFO/`: Matches lines containing `INFO`.  
- `d`: Deletes the matched lines.

---

#### **Task 4: Append Text After `WARNING`**  
Command:  
```bash
sed '/WARNING/a\Please monitor the memory usage.' server.log
```

**Explanation**:  
- `/WARNING/`: Matches lines with `WARNING`.  
- `a`: Appends text after the matching line.

---

#### **Task 5: Transform Case of Specific Characters**  
Command:  
```bash
sed 'y/aeiou/AEIOU/' server.log
```

**Explanation**:  
- `y/aeiou/AEIOU/`: Converts all vowels to uppercase.

---

#### **Task 6: Extract Logs Between Timestamps**  
You need logs between `10:00` and `12:00`.

Command:  
```bash
sed -n '/10:00/,/12:00/p' server.log
```

**Explanation**:  
- `/10:00/,/12:00/`: Matches lines between these patterns inclusively.  
- `p`: Prints matched lines.

---

#### **Task 7: Write All `ERROR` Lines to a File**  
Command:  
```bash
sed -n '/ERROR/w errors.log' server.log
```

**Explanation**:  
- `/ERROR/`: Matches lines with `ERROR`.  
- `w errors.log`: Writes matched lines to `errors.log`.

---

#### **Task 8: Replace a Full Line Matching a Pattern**  
Command:  
```bash
sed '/Disk space low/c\ERROR: Critical disk space issue' server.log
```

**Explanation**:  
- `/Disk space low/`: Matches the line.  
- `c`: Replaces the entire line.

---

### Combining Commands in a Script  
You can combine multiple `sed` commands using `-e` or a script file.

**Example**:  
```bash
sed -e 's/ERROR/ALERT/g' -e '/INFO/d' -e '/WARNING/a\Take action immediately.' server.log
```

---

### Advanced Use Case: Inline Editing  
To modify the file directly, use the `-i` option:  
```bash
sed -i 's/ERROR/ALERT/g' server.log
```  

--- 

### Case Study 02: Cleaning and Transforming a CSV File

#### **Scenario**  
You have a CSV file named `employees.csv` containing employee details:

```csv
ID,Name,Department,Salary,Join Date
101,John Doe,Engineering,50000,2020-01-15
102,Jane Smith,HR,45000,2019-03-10
103,Emily Davis,Engineering,55000,2021-05-22
104,Michael Brown,Sales,40000,2018-08-19
105,Sarah Wilson,Engineering,60000,2017-11-05
```

You need to perform several tasks on this data using `sed`.

---

### **Tasks**

#### **Task 1: Remove the Header Line**  
Command:  
```bash
sed '1d' employees.csv
```

**Explanation**:  
- `1d`: Deletes the first line (header).

---

#### **Task 2: Extract Employees from the Engineering Department**  
Command:  
```bash
sed -n '/Engineering/p' employees.csv
```

**Explanation**:  
- `/Engineering/`: Matches lines with "Engineering".  
- `p`: Prints the matched lines.

---

#### **Task 3: Replace the Department Name "HR" with "Human Resources"**  
Command:  
```bash
sed 's/,HR,/,Human Resources,/g' employees.csv
```

**Explanation**:  
- `s/,HR,/,Human Resources,/g`: Substitutes the exact match of `,HR,` with `,Human Resources,`.  
- `g`: Ensures all occurrences in the file are replaced.

---

#### **Task 4: Add a New Column for "Years of Experience"**  
Assume the file doesn't include a header. Add a "Years of Experience" column based on the join date.

Command:  
```bash
sed 's/$/,Years of Experience/' employees.csv
```

**Explanation**:  
- `$`: Matches the end of the line.  
- `,Years of Experience`: Appends this text at the end.

For data rows, calculate the years of experience (assuming the current year is 2025).

Command:  
```bash
sed -E 's/([0-9]{4})-[0-9]{2}-[0-9]{2}$/,&,\4y/' employees.csv
```

---

#### **Task 5: Increase Salaries by 10% for All Employees**  
Command:  
```bash
sed -E 's/([0-9]+)$/logix/"

Let's fix that last example for clarity and correctness.

---

#### **Task 5: Increase Salaries by 10% for All Employees**  
To increase the salary field (4th column) by 10%, we need to process numeric values dynamically. Since `sed` alone does not handle arithmetic well, we use a pipeline with `awk` for the math but focus on the `sed` transformation logic.

**Step 1: Extract Salaries**  
Command:  
```bash
sed -E 's/^([^,]+,[^,]+,[^,]+,)([0-9]+)(,.*)$/echo "\1$(echo "\2*1.1" | bc)\3"/e' employees.csv
```

**Explanation**:  
- `-E`: Enables extended regex for easier grouping.  
- `^([^,]+,[^,]+,[^,]+,)`: Captures the first three columns (everything before the salary).  
- `([0-9]+)`: Captures the numeric salary value.  
- `(,.*)$`: Captures the rest of the line.  
- `echo` and `bc`: Embedded commands calculate a 10% increase.

**Step 2: Inline Editing**  
Use the `-i` flag to edit the file in place:
```bash
sed -i -E '...' employees.csv
```

---

#### **Task 6: Remove Employees Who Joined Before 2020**  
Command:  
```bash
sed -E '/,[0-9]{4}-[0-9]{2}-[0-9]{2}$/!d; /,201[0-9]-[0-9]{2}-[0-9]{2}$/d' employees.csv
```

**Explanation**:  
- `/,[0-9]{4}-[0-9]{2}-[0-9]{2}$/!d`: Ensures we match rows with valid dates.  
- `/,201[0-9]-[0-9]{2}-[0-9]{2}$/d`: Deletes rows where the year is before 2020.

---

#### **Task 7: Reformat Dates from `YYYY-MM-DD` to `MM/DD/YYYY`**  
Command:  
```bash
sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})/\2\/\3\/\1/' employees.csv
```

**Explanation**:  
- `([0-9]{4})-([0-9]{2})-([0-9]{2})`: Captures the date components.  
- `\2/\3/\1`: Rearranges and formats them as `MM/DD/YYYY`.

---

#### **Task 8: Save Lines Matching Multiple Criteria**  
Extract employees in "Engineering" earning more than $50,000.

Command:  
```bash
sed -n '/Engineering/ { /,5[5-9][0-9][0-9][0-9]/p }' employees.csv
```

**Explanation**:  
- `/Engineering/`: Matches the department.  
- `/,[5-9][0-9]{4}/`: Ensures the salary is above 50,000.  
- `p`: Prints matched lines.

