


Using `NR` Variable in `awk` with Relational Operators

`NR` (Number of Record) can be used with all relational operators to filter records in a file. Below are some examples:

Examples

1. Skip the First Two Records:
   ```bash
   awk 'NR>2 {print $0}' FS="," emp.csv
   ```

2. Print the First Field of Records After the First Two:
   ```bash
   awk 'NR>2 {print $1}' FS="," emp.csv
   ```

3. Display Only the 2nd and 4th Records:
   ```bash
   awk 'NR==2 || NR==4 {print $0}' FS="," emp.csv
   ```
   *Output*: Displays the full content of the 2nd and 4th records.

4. Display the First Field of the 2nd and 4th Records:
   ```bash
   awk 'NR==2 || NR==4 {print $1}' FS="," emp.csv
   ```
   *Output*: Displays only the first field of the 2nd and 4th records.

5. Display the 3rd and 4th Records:
   ```bash
   awk 'NR>2 && NR<5 {print $0}' FS="," emp.csv
   ```

6. Display Records from the 2nd to the 4th:
   ```bash
   awk 'NR>1 && NR<5 {print $0}' FS="," emp.csv
   ```

7. Display Records Between the 2nd and 4th (Inclusive):
   ```bash
   awk 'NR==2, NR==4 {print $0}' FS="," emp.csv
   ```
   *Output*: Displays records from the 2nd to the 4th.

Explanation of `$0`, `$1`, `$2`, ... in `awk`

In `awk`, each line of a file is treated as a **record**, and fields within a record are separated by the **Field Separator** (`FS`, default is whitespace).  
- `$0`: Refers to the entire record (the full line).  
- `$1`: Refers to the first field.  
- `$2`, `$3`, and so on refer to the respective fields.

Example Data (File: `emp.csv`)
```csv
100,Durga,1000,Mumbai
200,Bunny,2000,Hyderabad
300,Chinny,3000,Hyderabad
400,Vinny,4000,Chennai
500,Pinny,5000,Mumbai
```

Using `awk` with Examples

1. Print the Entire Line (`$0`):
   ```bash
   awk '{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   100,Durga,1000,Mumbai
   200,Bunny,2000,Hyderabad
   300,Chinny,3000,Hyderabad
   400,Vinny,4000,Chennai
   500,Pinny,5000,Mumbai
   ```

2. Print the First Field (`$1`):
   ```bash
   awk '{print $1}' FS="," emp.csv
   ```
   **Output**:
   ```
   100
   200
   300
   400
   500
   ```

3. Print the Second Field (`$2`):
   ```bash
   awk '{print $2}' FS="," emp.csv
   ```
   **Output**:
   ```
   Durga
   Bunny
   Chinny
   Vinny
   Pinny
   ```

4. Print the Third Field (`$3`):
   ```bash
   awk '{print $3}' FS="," emp.csv
   ```
   **Output**:
   ```
   1000
   2000
   3000
   4000
   5000
   ```

5. Print the Fourth Field (`$4`):
   ```bash
   awk '{print $4}' FS="," emp.csv
   ```
   **Output**:
   ```
   Mumbai
   Hyderabad
   Hyderabad
   Chennai
   Mumbai
   ```

Advanced Examples

1. Print Specific Fields (`$1` and `$2`):
   ```bash
   awk '{print $1, $2}' FS="," emp.csv
   ```
   **Output**:
   ```
   100 Durga
   200 Bunny
   300 Chinny
   400 Vinny
   500 Pinny
   ```

2. Print Fields in a Custom Format:
   ```bash
   awk '{print "ID:", $1, "Name:", $2, "Salary:", $3, "City:", $4}' FS="," emp.csv
   ```
   **Output**:
   ```
   ID: 100 Name: Durga Salary: 1000 City: Mumbai
   ID: 200 Name: Bunny Salary: 2000 City: Hyderabad
   ID: 300 Name: Chinny Salary: 3000 City: Hyderabad
   ID: 400 Name: Vinny Salary: 4000 City: Chennai
   ID: 500 Name: Pinny Salary: 5000 City: Mumbai
   ```

3. Print Only the Last Field (`$NF`):
   ```bash
   awk '{print $NF}' FS="," emp.csv
   ```
   **Output**:
   ```
   Mumbai
   Hyderabad
   Hyderabad
   Chennai
   Mumbai
   ```

4. Print All Fields Except the Last (`$(NF-1)`):
   ```bash
   awk '{for (i=1; i<NF; i++) printf $i ","; print ""}' FS="," emp.csv
   ```
   **Output**:
   ```
   100,Durga,1000,
   200,Bunny,2000,
   300,Chinny,3000,
   400,Vinny,4000,
   500,Pinny,5000,
   ```

Key Points

- `$0`: Entire record (full line).  
- `$1`: First field.  
- `$NF`: Last field.  
- `NF`: Total number of fields in the current record.  


Q) Consider the File: `xy.txt`
```plaintext
1.abc
2.def
3.ghi
4.jkl5.mno
```

What is the output of the following commands?

1. Command:
   ```bash
   awk '{print $0;}' xy.txt
   ```
   **Explanation**: It will print the entire file as it is.  
   **Output**:
   ```
   1.abc
   2.def
   3.ghi
   4.jkl5.mno
   ```

2. Command:
   ```bash
   awk '{print $1;}' xy.txt
   ```
   **Explanation**: It will print the entire file because the file contains only one column.  
   **Output**:
   ```
   1.abc
   2.def
   3.ghi
   4.jkl5.mno
   ```

3. Command:
   ```bash
   awk '{print $2;}' xy.txt
   ```
   **Explanation**: Nothing will be printed because there is no second column in the file.  
   **Output**: *(No Output)*

AWK Code into a Separate File

We can separate AWK code into a file and use the `-f` option to execute it.

Example

AWK Code File (`x.txt`):
```awk
BEGIN {print "BEGIN"}
{print $0}
END {print "END"}
```

Command:
```bash
awk -f x.txt FS="," emp.csv
```

**Output**:
```
BEGIN
eno,ename,esal,eaddr
100,Sunny,1000,Mumbai
200,Bunny,2000,Hyderabad
300,Chinny,3000,Hyderabad
400,Vinny,4000,Chennai
500,Pinny,5000,Mumbai
END
```

Filter Data Based on Conditions

1. List all employees where `eaddr` is Hyderabad:
   ```bash
   awk '$4=="Hyderabad"{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   200,Bunny,2000,Hyderabad
   300,Chinny,3000,Hyderabad
   ```

2. List all employees where `esal` is greater than 2500:
   ```bash
   awk '$3>2500{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   eno,ename,esal,eaddr
   300,Chinny,3000,Hyderabad
   400,Vinny,4000,Chennai
   500,Pinny,5000,Mumbai
   ```

3. Skip the header and filter records where `esal` is greater than 2500:
   ```bash
   awk 'NR!=1 && $3>2500{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   300,Chinny,3000,Hyderabad
   400,Vinny,4000,Chennai
   500,Pinny,5000,Mumbai
   ```

Search Records Using a String

1. Filter all records containing `20` in any field:
   ```bash
   awk '/20/{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   200,Bunny,2000,Hyderabad
   20,Durga,5000,Hyderabad
   50,Shiva,2020,Hyderabad
   ```

2. Filter records where the 3rd field contains `20`:
   ```bash
   awk '$3~/20/{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   200,Bunny,2000,Hyderabad
   50,Shiva,2020,Hyderabad
   ```

3. Exclude records where the 3rd field contains `20`:
   ```bash
   awk '$3!~/20/{print $0}' FS="," emp.csv
   ```
   **Output**:
   ```
   eno,ename,esal,eaddr
   100,Sunny,1000,Mumbai
   300,Chinny,3000,Hyderabad
   400,Vinny,4000,Chennai
   500,Pinny,5000,Mumbai
   ```

Key Notes

1. AWK treats every file as a tabular file by default.  
2. Use `FS` to specify the field separator (default is whitespace).  
3. Search strings can be applied globally or to specific fields using conditional expressions.

Match Total Field Value

1. Match any field containing `2000`:
   ```bash
   awk '/2000/{print $0}' FS="," emp.csv
   ```

2. Match if the 3rd field contains `2000`:
   ```bash
   awk '$3~/2000/{print $0}' FS="," emp.csv
   ```

3. Match if the 3rd field value is exactly `2000`:
   ```bash
   awk '$3==2000{print $0}' FS="," emp.csv
   ```

4. Match if the 4th field value is exactly `Hyderabad`:
   ```bash
   awk '$4=="Hyderabad"{print $0}' FS="," emp.csv
   ```

Increment Salary by 500 Where Salary is Less Than 3000

1. Print records where salary is less than 3000:
   ```bash
   awk -F "," '{if($3<3000) print $0}' emp.csv
   ```

2. Increment salary by 500 where salary is less than 3000:
   ```bash
   awk -F "," '{if($3<3000) {$3=$3+500;print $0}}' emp.csv
   ```

Count Employees with Salary Greater Than 3000

1. Command:
   ```bash
   awk -F "," 'BEGIN{c=0}NR!=1{if($3>3000){c=c+1;print $0;}}END{print "The Total Number of Employees where salary > 3000 :" c}' emp.csv
   ```

Another Way to Count Employees

AWK Code File (`x.txt`):
```awk
BEGIN {
 FS=",";
 c=0;
}
NR!=1 {
 if($3>3000) {
   c=c+1;
   print $0;
 }
}
END {
 print "The Total Number of Employees where salary > 3000 :" c;
}
```

Command:
```bash
awk -f x.txt emp.csv
```
