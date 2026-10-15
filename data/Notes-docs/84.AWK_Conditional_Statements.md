# AWK: `if-else` and `for` Loop Syntax with Examples

## `if-else` Syntax in AWK

```awk
if (condition) {
    commands
} else {
    commands
}
```

### Example 1: Using Inline AWK Command

**Input File: `emp.txt`**
```
eno ename esal eaddr
100 Tanya 1000 Mumbai
200 Bunny 2000 Hyderabad
300 Chinny 3000 Hyderabad
400 Vinny 4000 Chennai
500 Pinny 5000 Mumbai
```

**AWK Command:**
```bash
awk 'NR!=1 {
    if ($3 > 3000) {
        print $2 " is very costly employee"
    } else {
        print $2 " is not costly employee"
    }
}' emp.txt
```

**Output:**
```
Tanya is not costly employee
Bunny is not costly employee
Chinny is not costly employee
Vinny is very costly employee
Pinny is very costly employee
```

### Example 2: Using an AWK Script File

**Input File: `emp.csv`**
```
eno,ename,esal,eaddr
100,Tanya,1000,Mumbai
200,Bunny,2000,Hyderabad
300,Chinny,3000,Hyderabad
400,Vinny,4000,Chennai
500,Pinny,5000,Mumbai
20,Durga,7000,Hyderabad
```

**AWK Script File: `x.txt`**
```awk
BEGIN {
    FS = ",";
}
NR != 1 {
    if ($3 > 3000) {
        print $2 " is very costly employee"
    } else {
        print $2 " is not costly employee"
    }
}
```

**Run the Script:**
```bash
awk -f x.txt emp.csv
```

**Output:**
```
Tanya is not costly employee
Bunny is not costly employee
Chinny is not costly employee
Vinny is very costly employee
Pinny is very costly employee
Durga is very costly employee
```

## `for` Loop Syntax in AWK

```awk
for (initialization; condition; increment/decrement) {
    commands
}
```

### Example 1: Basic `for` Loop

```bash
awk 'BEGIN {
    for (i = 1; i <= 5; i++) {
        print "The Iteration Number:" i
    }
}'
```

**Output:**
```
The Iteration Number:1
The Iteration Number:2
The Iteration Number:3
The Iteration Number:4
The Iteration Number:5
```

### Example 2: Iterating Over Fields in a String

```bash
echo "CAT DOG RAT TIGER" | awk '{
    for (i = 1; i <= NF; i++) {
        print "Field:" i ":" $i
    }
}'
```

**Output:**
```
Field:1:CAT
Field:2:DOG
Field:3:RAT
Field:4:TIGER
```

### Example 3: Iterating Over Fields in a File

**Command:**
```bash
cat emp.txt | awk '{
    for (i = 1; i <= NF; i++) {
        print "Field:" i ":" $i
    }
    print ""
}'
```

## Conditionals in AWK with Case Study

Types of conditionals in AWK:
- `if`
- `if-else`
- `if-else if-else`
- Ternary operator (`condition ? expression1 : expression2`)

### 1. **`if` Statement in AWK**

**Syntax:**
```awk
if (condition) {
    commands
}
```

**Example:**
```bash
awk '{ if ($3 > 3000) print $2 " has a high salary"; }' emp.txt
```

**Explanation:**  
Prints employee names whose salary is greater than 3000.

### 2. **`if-else` Statement in AWK**

**Syntax:**
```awk
if (condition) {
    commands
} else {
    commands
}
```

**Example:**
```bash
awk '{
    if ($3 > 3000) {
        print $2 " is highly paid"
    } else {
        print $2 " is not highly paid"
    }
}' emp.txt
```

**Explanation:**  
Classifies employees based on their salary.

### 3. **`if-else if-else` Ladder in AWK**

**Syntax:**
```awk
if (condition1) {
    commands
} else if (condition2) {
    commands
} else {
    commands
}
```

**Example:**
```bash
awk '{
    if ($3 >= 5000) {
        print $2 " is a top earner"
    } else if ($3 >= 3000) {
        print $2 " is a mid-level earner"
    } else {
        print $2 " is a junior earner"
    }
}' emp.txt
```

**Explanation:**  
Categorizes employees into three earning levels.

### 4. **Ternary Operator in AWK**

**Syntax:**
```awk
condition ? expression_if_true : expression_if_false
```

**Example:**
```bash
awk '{ print $2, ($3 > 3000 ? "Expensive Employee" : "Affordable Employee") }' emp.txt
```

**Explanation:**  
Performs a compact if-else operation in a single line.

### 5. **Logical Operators in AWK Conditionals**

- `&&` (AND): Executes if both conditions are true.
- `||` (OR): Executes if at least one condition is true.
- `!` (NOT): Executes if the condition is false.

**Example:**
```bash
awk '{
    if ($3 > 3000 && $4 == "Mumbai") {
        print $2 " is a high earner in Mumbai"
    }
}' emp.txt
```

## Case Study: Employee Data Analysis Using AWK Conditionals

**Scenario:**  
Analyze an employee dataset to classify employees based on salary, location, and experience.

**Dataset: `emp.csv`**
```
eno,ename,esal,eaddr,exp
100,Tanya,1000,Mumbai,1
200,Bunny,2000,Hyderabad,3
300,Chinny,3000,Hyderabad,5
400,Vinny,4000,Chennai,8
500,Pinny,5000,Mumbai,10
600,Durga,7000,Hyderabad,12
```

**AWK Script: `employee_analysis.awk`**
```awk
BEGIN {
    FS = ",";
    print "Employee Analysis Report\n---------------------------"
}

NR != 1 {
    # Salary-based classification
    if ($3 >= 5000) {
        salary_status = "Top Earner"
    } else if ($3 >= 3000) {
        salary_status = "Mid-Level Earner"
    } else {
        salary_status = "Junior Earner"
    }

    # Experience-based classification
    experience_status = ($5 >= 10) ? "Highly Experienced" : ($5 >= 5) ? "Experienced" : "Fresher"

    # Location-based classification
    if ($4 == "Mumbai" && $3 > 4000) {
        location_status = "Premium Mumbai Employee"
    } else if ($4 == "Hyderabad") {
        location_status = "Hyderabad Employee"
    } else {
        location_status = "Other Location Employee"
    }

    # Final report
    print $2 " | " salary_status " | " experience_status " | " location_status
}
```

**Run the Script:**
```bash
awk -f employee_analysis.awk emp.csv
```

**Output:**
```
Employee Analysis Report
---------------------------
Tanya | Junior Earner | Fresher | Premium Mumbai Employee
Bunny | Junior Earner | Fresher | Hyderabad Employee
Chinny | Mid-Level Earner | Experienced | Hyderabad Employee
Vinny | Mid-Level Earner | Experienced | Other Location Employee
Pinny | Top Earner | Highly Experienced | Premium Mumbai Employee
Durga | Top Earner | Highly Experienced | Hyderabad Employee
```

**Key Features:**
1. **Layered Conditionals:**  
   - Used nested `if-else` statements for multi-level salary classification.
   - Implemented ternary operators for concise experience-based classification.

2. **Multiple Conditions Handling:**  
   - Logical operators (`&&`, `||`) handled location and salary-based categorization.

3. **Reusable AWK Scripts:**  
   - Separated business logic into an AWK script (`employee_analysis.awk`) for reusability.

## Field Separators in AWK (FS) with Examples

| **Field Separator** | **Description**                  | **Example Command**                                           | **Sample Input**                     | **Output**                  |
|---------------------|----------------------------------|---------------------------------------------------------------|----------------------------------------|-----------------------------|
| **Space (default)** | Default separator (whitespace)   | `awk '{print $1, $2}' data.txt`                               | `101 Tanya Pune`                      | `101 Tanya`                 |
| **Comma (,)**       | For CSV files                    | `awk 'BEGIN{FS=","} {print $1, $3}' employees.csv`             | `101,Tanya,5000,Pune`                 | `101 5000`                  |
| **Colon (:)**       | For `/etc/passwd`-like files     | `awk 'BEGIN{FS=":"} {print $1, $3}' users.txt`                 | `user:x:1000:1000:/home/user:/bin/bash`| `user 1000`                 |
| **Tab (\t)**        | Tab-separated files              | `awk 'BEGIN{FS="\t"} {print $1, $2}' data.txt`                 | `102\tDurga\tDelhi`                     | `102 Durga`                   |
| **Pipe (\|)**        | Data with pipe delimiter         | `awk 'BEGIN{FS="\|"} {print $2, $4}' records.txt`               | `103\|Charlie\|4500\|Bangalore`           | `Charlie Bangalore`         |
| **Multiple Spaces** | Ignore multiple spaces           | `awk 'BEGIN{FS="[ ]+"} {print $1, $3}' data.txt`               | `104   Diana   Mumbai`                | `104 Mumbai`                |
| **Hyphen (-)**      | Hyphen-separated data            | `awk 'BEGIN{FS="-"} {print $1, $2}' projects.txt`              | `105-Eve-Chennai`                     | `105 Eve`                   |
| **Custom RegEx**    | Combination of delimiters        | `awk 'BEGIN{FS="[:,]"} {print $1, $3}' data.txt`               | `106:Frank,6000,Hyderabad`             | `106 6000`                  |

### Example Files Content  

**employees.csv:**
```
101,Tanya,5000,Pune
102,Durga,4000,Delhi
103,Charlie,4500,Bangalore
104,Diana,6000,Mumbai
```

**records.txt:**
```
103|Charlie|4500|Bangalore
104|Diana|6000|Mumbai
```

### Dynamic FS using `-F` option  
```bash
awk -F"," '{print $1, $4}' employees.csv   # Comma as separator
awk -F"|" '{print $2}' records.txt         # Pipe as separator
awk -F"\t" '{print $1, $2}' data.txt       # Tab as separator
```

## Predefined Variables in AWK  

| **Variable** | **Description**                                | **Example Command**                                 | **Sample Output**              |
|--------------|------------------------------------------------|-----------------------------------------------------|---------------------------------|
| **FS**       | Field Separator (default: space/tab)           | `awk 'BEGIN{FS=","} {print $1}' employees.csv`        | `101`, `102`, `103`, `104`     |
| **NF**       | Number of fields in the current record         | `awk '{print "Fields:", NF}' employees.csv`          | `Fields: 4` (for each line)    |
| **NR**       | Number of the current record (line number)     | `awk '{print "Line:", NR, $0}' employees.csv`        | `Line: 1 101,Tanya,5000,Pune`  |
| **RS**       | Record Separator (splits records)            | Newline (`\n`)     |

### Advanced FS Example (Multiple Delimiters)  
```bash
awk 'BEGIN{FS="[:,]"} {print $1, $2, $3}' multi_sep.txt
```
**multi_sep.txt:**
```
201:George,7500,Hyderabad
202:Helen,8000,Chennai
```
**Output:**
```
201 George 7500
202 Helen 8000
```

### Examples Using Predefined Variables

#### FS (Field Separator) Example

```bash
echo "Apple,Banana,Carrot" | awk 'BEGIN {FS=","} {print $1, $2, $3}'
```
**Output:**
```
Apple Banana Carrot
```

#### NR (Number of Records) & NF (Number of Fields) Example

```bash
echo "Apple Banana Carrot" | awk 'END {print "The Number of Records:", NR; print "The Number of Fields:", NF}'
```
**Output:**
```
The Number of Records: 1
The Number of Fields: 3
```

**Note:**  
- `NR` gives the total number of lines processed.  
- `NF` gives the number of fields in the last processed record.  
- In the **BEGIN block**, `NR` and `NF` are always **0** because no data has been processed yet.

#### Checking Records in a File (`emp.txt`)

```bash
awk 'END {print "The Number of Records:", NR; print "The Number of Fields:", NF}' emp.txt
```

#### Using RS (Record Separator) and FS Together

**Sample File (`demo.txt`):**
```
APPLE,BANANA:CAT,DOG:JAVA,PYTHON
```

**Example Command:**
```bash
awk 'BEGIN {FS=","; RS=":"} {print "Record Number:", NR; print $1 "--->" $2; print ""} END {print "Total Records:", NR; print "Fields in Last Record:", NF;}' demo.txt
```

**Output:**
```
Record Number: 1
APPLE--->BANANA

Record Number: 2
CAT--->DOG

Record Number: 3
JAVA--->PYTHON

Total Records: 3
Fields in Last Record: 2
```

### BEGIN, ACTION, and END Block Execution Order

```bash
awk '{print "ACTION"} BEGIN {print "BEGIN"} END {print "END"}' demo.txt
```

**Output:**
```
BEGIN
ACTION
END
```

**Note:**  
- Although you can change the order of `BEGIN`, `ACTION`, and `END` blocks in code, it's **not recommended** for readability.
- The execution always follows:  
  - **BEGIN** → **ACTION** (for each line) → **END**

## Key Takeaways  
- Use **FS** for customizing field separation (e.g., `FS=","` for CSV files).  
- **NR** and **NF** provide insights into processed data — total lines and fields per line.  
- **RS** can be customized for non-standard record delimiters (e.g., `RS=":"`).  
- Always remember that **NR** and **NF** are **0** in the `BEGIN` block.