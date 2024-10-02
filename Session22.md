## Sorting File Content

We can sort data in a file using the `sort` command:  
```bash
sort filename
```
This sorts the content based on **alphabetical order**.

### Example:
```bash
akshay@Ubuntu:~/Desktop cat a.txt
Sunny  
Bunny  
Chinny  
Pinny  
Vinny  

akshay@Ubuntu:~/Desktop sort a.txt  
Bunny  
Chinny  
Pinny  
Sunny  
Vinny
```
- To save the sorted content into another file (`sorted.txt`), use:
```bash
sort a.txt > sorted.txt
```

To sort the content in **reverse alphabetical order**, use the `-r` option:  
```bash
sort -r a.txt > sorted.txt
```

### Removing Duplicate Lines:
To remove duplicate lines from a file, use:
```bash
sort -u a.txt | tac > sorted.txt
sort -ru a.txt > sorted.txt
```

### Sorting File Alphabetically:
```bash
 sort a.txt  
Bunny  
Chinny  
Pinny  
Sunny  
Vinny
```

### Sorting in Reverse Alphabetical Order:
```bash
 sort -r a.txt  
Vinny  
Sunny  
Pinny  
Chinny  
Bunny
```

### Sorting Alphanumeric Data:
```bash
 cat a.txt
7  
Sunny  
8  
Bunny  
1  
Chinny  
6  
Vinny  
5  
Pinny  

 sort a.txt
1  
5  
6  
7  
8  
Bunny  
Chinny  
Pinny  
Sunny  
Vinny
```

### Sorting Alphanumeric Data in Reverse Order:
```bash
 sort -r a.txt  
Vinny  
Sunny  
Pinny  
Chinny  
Bunny  
8  
7  
6  
5  
1
```

### Sorting Numeric Data:
By default, the `sort` command does not sort numbers numerically but based on their string (digit-wise) representation.
```bash
 cat a.txt  
11  
2  
7  
2222222  
9  

 sort a.txt  
11  
2  
2222222  
7  
9
```

#### Sorting Numbers Numerically Using the `-n` Option:
```bash
 sort -n a.txt  
2  
7  
9  
11  
2222222
```

### Sorting with Unique Lines:
By default, `sort` includes all lines, including duplicates. Use the `-u` option to display only unique lines:
```bash
 cat a.txt  
1  
1  
2  
2  
Sunny  
Sunny  
Bunny  

 sort -u a.txt  
1  
2  
Bunny  
Sunny
```

### Commands for Sorting Tabular Data

1. **Sort Based on File Size (Ascending Order)**:
   ```bash
    ls -l /etc | head -10 | sort -k 5n
   ```
   This command sorts based on the 5th column (file size) in ascending order.

2. **Sort Based on Month**:
   ```bash
    ls -l /etc | head -10 | sort -k 6M
   ```
   This sorts by the 6th column (month) in ascending order.

3. **Sort Based on Number of Links (Descending Order)**:
   ```bash
    ls -l /etc | head -10 | sort -k 2nr
   ```
   Sorts based on the 2nd column (number of links) in descending order.

### Sorting Tabular Data Using the `-k` Option:
The `-k` option is used to sort based on a specific column.

Example:
```bash
ls -l /etc | head -10 | sort -k 5n
```
This sorts based on **file size** (5th column) in ascending order.

### Sorting Based on Number of Links in Descending Order:
```bash
ls -l /etc | head -10 | sort -k 2nr
```

### Finding Lowest and Highest Salaries Using `sort`:

`emp.txt` file content:
```
800: Avinash:500:Warangal  
100: Yashwant:1000:Mumbai  
200: Omkar:2000:Chennai  
300: Chinmay:3000:Hyderabad  
600: Shreya:6000:Hyderabad  
400: Vaibhav:4000:Delhi  
500: Pragati:5000:Hyderabad  
700: Shailesh:7000:Ranchi
```

1. **Find Lowest Salary Record**:
   ```bash
    sort -k 3n -t ":" emp.txt | head -1
   ```
   This finds the employee with the lowest salary.

2. **Find Highest Salary Record**:
   ```bash
    sort -k 3nr -t ":" emp.txt | head -1
   ```
   This finds the employee with the highest salary.

### Working with Unique Content Using `uniq`

The `uniq` command is used to display unique lines. However, the file needs to be **sorted** for `uniq` to work properly.

#### Example (Without Sorting):
```bash
 cat a.txt  
Sunny  
sunny  
Bunny  
Chinny  
Sunny  
Bunny  
Chinny  

 uniq a.txt  
Sunny  
sunny  
Bunny  
Chinny  
Sunny  
Bunny  
Chinny
```
Without sorting, `uniq` doesn't remove duplicates correctly.

#### Correct Usage (With Sorting):
```bash
 sort a.txt | uniq  
Bunny  
Chinny  
sunny  
Sunny
```

### `uniq` Command Options:

1. **To Display Only Duplicate Lines**:
   ```bash
    sort a.txt | uniq -d  
   Bunny  
   Chinny  
   Sunny
   ```

2. **To Display the Number of Occurrences of Each Line**:
   ```bash
    sort a.txt | uniq -c  
     2 Bunny  
     2 Chinny  
     1 sunny  
     2 Sunny
   ```

3. **To Ignore Case While Comparing**:
   ```bash
    sort a.txt | uniq -i  
   Bunny  
   Chinny  
   sunny  
   Sunny
   ```

4. **To Display Only Unique Lines (Lines Not Duplicated)**:
   ```bash
    sort a.txt | uniq -u  
   sunny
   ```