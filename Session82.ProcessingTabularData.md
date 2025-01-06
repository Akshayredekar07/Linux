## `awk` command for processing tabular data

1. **Field Representations**:
   - `$0`: Represents the entire line or record.
   - `$1`: Represents the first column.
   - `$2`: Represents the second column.
   - `$3`: Represents the third column, and so on.

2. **Default Separator**:
   - By default, `awk` treats **tab** as the field separator.
   - For other separators (e.g., `,` in CSV files), use the `-F` option or `FS` variable.

3. **Processing Commands**:
   - To print specific fields or the entire line, use `print` with field variables.
   - Logical and relational operators with the `NR` variable (row number) allow row-based operations.


#### 1. Printing Specific Fields
```bash
awk '{print $1}' emp.txt
```
Output:
```
eno
100
200
300
400
500
```

#### 2. Printing First and Third Columns
```bash
awk '{print $1 " " $3}' emp.txt
```
Output:
```
eno esal
100 1000
200 2000
300 3000
400 4000
500 5000
```

#### 3. Processing CSV Files
Using `,` as the separator:
```bash
awk -F "," '{print $2 " " $4}' emp.csv
```
Output:
```
ename eaddr
Durga Mumbai
Bunny Hyderabad
Chinny Hyderabad
Vinny Chennai
Pinny Mumbai
```

#### 4. Displaying Content Without the Header
```bash
awk 'NR != 1 {print $0}' FS="," emp.csv
```
Output:
```
100,Durga,1000,Mumbai
200,Bunny,2000,Hyderabad
300,Chinny,3000,Hyderabad
400,Vinny,4000,Chennai
500,Pinny,5000,Mumbai
```


### **Relational Operators with `NR`**
- `NR` (Number of Records) is useful for filtering specific rows.
- Examples:
  ```bash
  awk 'NR==2 || NR==4 {print $0}' FS="," emp.csv
  ```
  Output:
  ```
  200,Bunny,2000,Hyderabad
  400,Vinny,4000,Chennai
  ```

  ```bash
  awk 'NR>2 && NR<5 {print $0}' FS=","
  ```
  Output:
  ```
  300,Chinny,3000,Hyderabad
  400,Vinny,4000,Chennai
  ```


### **Handling Single-Column Data**
File: `xy.txt`
```
1.abc
2.def
3.ghi
4.jkl5.mno
```
Commands:
1. **Entire Line**:
   ```bash
   awk '{print $0}' xy.txt
   ```
   Output:
   ```
   1.abc
   2.def
   3.ghi
   4.jkl5.mno
   ```

2. **First Column**:
   ```bash
   awk '{print $1}' xy.txt
   ```
   Output:
   ```
   1.abc
   2.def
   3.ghi
   4.jkl5.mno
   ```

3. **Second Column**:
   ```bash
   awk '{print $2}' xy.txt
   ```
   Output:
   *(Nothing is printed because there is no second column.)*


### **Key Notes**
- The **default separator** for `awk` is **tab**. If you need to work with another separator (e.g., commas), you must specify it using `-F` or `FS`.
- `awk` assumes all input files are **tabular**.
- Relational operators (`!=`, `<`, `>`, `<=`, etc.) work effectively with the `NR` variable for filtering rows.
