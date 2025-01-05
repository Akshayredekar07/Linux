# Stream Editor (SED)

We can use the `sed` command to retrieve and edit data present in the given file. We can perform operations based on lines, like deleting the 2nd line, etc. We can also perform operations based on content, like deleting lines where the word "python" is present, etc.

**Example file: emp.dat**
```
eno|ename|esal|eaddr|dept|gender
100|sunny|1000|mumbai|admin|female
200|bunny|2000|chennai|sales|male
300|chinny|3000|delhi|accounting|female
400|vinny|4000|hyderabad|admin|male
500|pinny|5000|mumbai|sales|female
```

### 1. Display Specific Line Multiple Times:
```bash
$ sed '2p' emp.dat
```
- `p` means print.
- It will display the entire file content, but the 2nd line will be displayed twice.

Example output:
```
eno|ename|esal|eaddr|dept|gender
100|sunny|1000|mumbai|admin|female
100|sunny|1000|mumbai|admin|female
200|bunny|2000|chennai|sales|male
300|chinny|3000|delhi|accounting|female
400|vinny|4000|hyderabad|admin|male
500|pinny|5000|mumbai|sales|female
```

### 2. Display Only Specific Line:
```bash
$ sed -n '3p' emp.dat
```
- `-n` means suppress automatic printing.
- `3p` means print the 3rd line.

Alternatively, you can use:
```bash
$ head -n 3 emp.dat | tail -n 1
```
- `head -n 3` prints the first 3 lines.
- `tail -n 1` prints the last line of the output from `head`, which is the 3rd line.
- This will display only the 3rd line.

### 3. Display Last Line:
```bash
$ sed -n '$p' emp.dat
```
- `$` means the last line.

### 4. Display Multiple Lines in Range:
```bash
$ sed -n '2,4p' emp.dat
```
- It will display lines from 2nd to 4th.

### 5. Display Only Specific Independent Lines:
```bash
$ sed -n '2p
> 4p' emp.dat
```
Alternatively, you can use:
```bash
$ sed -n -e '2p' -e '4p' emp.dat
```
or:
```bash
$ sed -n -e '2p;4p' emp.dat
```

### 6. Display All Lines Except Specific Line:
```bash
$ sed -n '2!p' emp.dat
```
- It will display all lines except the 2nd line.

### 7. Display All Lines Except Range of Lines:
```bash
$ sed -n '2,4!p' emp.dat
```
- It will display all lines except for lines 2 to 4.

### 8. Display All Lines Having a Specific Word:
```bash
$ sed -n '/admin/p' emp.dat
```
- It will display all lines that contain the word "admin."

### 9. Deleting Data Present in the File:

#### A. Delete a Particular Line:
```bash
$ sed '3d' emp.dat
```
- `d` means delete.
- It deletes the 3rd record while displaying but does not modify the file.

```bash
$ sed '$d' emp.dat
```
- Deletes the last record.

```bash
$ sed '1d' emp.dat
```
- Deletes the first record.

#### B. Delete Permanently in the File:
```bash
$ sed -i '5d' emp.dat
```
- `-i` means it modifies the file in place and deletes the 5th record permanently.

#### C. Delete Range of Lines:
```bash
$ sed -i '1,$d' emp.dat
```
- Deletes all records from the 1st to the last in the file.

#### D. Delete Specified Lines:
```bash
$ sed -i '1d
> $d' emp.dat
```
- Deletes the first and last records.

