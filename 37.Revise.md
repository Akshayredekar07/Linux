
### **`emp.dat` File Content:**
```plaintext
eno|ename|esal|eaddr|dept|gender
100|sunny|1000|mumbai|admin|female
200|bunny|2000|chennai|sales|male
300|chinny|3000|delhi|accounting|female
400|vinny|4000|hyderabad|admin|male
500|pinny|5000|mumbai|sales|female
```

---

### **Cut Command Examples**

#### 1. **Display Character at Specific Position**
```bash
$ cut -c 9 emp.dat
```
- **Explanation:** Displays the 9th character from each line.
- **Output:**
  ```plaintext
  e
  y
  y
  n
  y
  y
  ```

---

#### 2. **Display Range of Characters**
- **Command 1:** Display characters from positions 5 to 9.
  ```bash
  $ cut -c 5-9 emp.dat
  ```
  - **Output:**
    ```plaintext
    |ena
    |sun
    |bun
    |chi
    |vin
    |pin
    ```

- **Command 2:** Display from the 5th character to the last.
  ```bash
  $ cut -c 5- emp.dat
  ```
  - **Output:**
    ```plaintext
    |ename|esal|eaddr|dept|gender
    |sunny|1000|mumbai|admin|female
    |bunny|2000|chennai|sales|male
    |chinny|3000|delhi|accounting|female
    |vinny|4000|hyderabad|admin|male
    |pinny|5000|mumbai|sales|female
    ```

- **Command 3:** Display characters from position 1 to 3.
  ```bash
  $ cut -c -3 emp.dat
  ```
  - **Output:**
    ```plaintext
    eno
    100
    200
    300
    400
    500
    ```

- **Command 4:** Display ranges 3 to 5 and 7 to 10.
  ```bash
  $ cut -c 3-5,7-10 emp.dat
  ```
  - **Output:**
    ```plaintext
    o|e
    0|su
    0|bu
    0|ch
    0|vi
    0|pi
    ```

---

#### 3. **Display Specific Column Data**
- **Command:** Display the 3rd column (salary).
  ```bash
  $ cut -d '|' -f 3 emp.dat
  ```
  - **Output:**
    ```plaintext
    esal
    1000
    2000
    3000
    4000
    5000
    ```

---

#### 4. **Display Range of Columns**
- **Command 1:** Display the 2nd and 3rd columns.
  ```bash
  $ cut -d '|' -f 2-3 emp.dat
  ```
  - **Output:**
    ```plaintext
    ename|esal
    sunny|1000
    bunny|2000
    chinny|3000
    vinny|4000
    pinny|5000
    ```

- **Command 2:** Display columns from 2nd to the last.
  ```bash
  $ cut -d '|' -f 2- emp.dat
  ```
  - **Output:**
    ```plaintext
    ename|esal|eaddr|dept|gender
    sunny|1000|mumbai|admin|female
    bunny|2000|chennai|sales|male
    chinny|3000|delhi|accounting|female
    vinny|4000|hyderabad|admin|male
    pinny|5000|mumbai|sales|female
    ```

- **Command 3:** Display columns 1 to 3.
  ```bash
  $ cut -d '|' -f -3 emp.dat
  ```
  - **Output:**
    ```plaintext
    eno|ename|esal
    100|sunny|1000
    200|bunny|2000
    300|chinny|3000
    400|vinny|4000
    500|pinny|5000
    ```

- **Command 4:** Display columns 1, 3, and 5.
  ```bash
  $ cut -d '|' -f 1,3,5 emp.dat
  ```
  - **Output:**
    ```plaintext
    eno|esal|dept
    100|1000|admin
    200|2000|sales
    300|3000|accounting
    400|4000|admin
    500|5000|sales
    ```

---

#### 5. **Skip Specific Column**
- **Command 1:** Skip the 3rd column.
  ```bash
  $ cut -d '|' --complement -f 3 emp.dat
  ```
  - **Output:**
    ```plaintext
    eno|ename|eaddr|dept|gender
    100|sunny|mumbai|admin|female
    200|bunny|chennai|sales|male
    300|chinny|delhi|accounting|female
    400|vinny|hyderabad|admin|male
    500|pinny|mumbai|sales|female
    ```

- **Command 2:** Skip columns 3 and 5.
  ```bash
  $ cut -d '|' --complement -f 3,5 emp.dat
  ```
  - **Output:**
    ```plaintext
    eno|ename|eaddr|gender
    100|sunny|mumbai|female
    200|bunny|chennai|male
    300|chinny|delhi|female
    400|vinny|hyderabad|male
    500|pinny|mumbai|female
    ```

- **Command 3:** Skip columns 3 to 5.
  ```bash
  $ cut -d '|' --complement -f 3-5 emp.dat
  ```
  - **Output:**
    ```plaintext
    eno|ename|gender
    100|sunny|female
    200|bunny|male
    300|chinny|female
    400|vinny|male
    500|pinny|female
    ```

- **Command 4:** Skip columns from 3 to the last.
  ```bash
  $ cut -d '|' --complement -f 3- emp.dat
  ```
  - **Output:**
    ```plaintext
    eno|ename
    100|sunny
    200|bunny
    300|chinny
    400|vinny
    500|pinny
    ```

- **Command 5:** Skip columns 1 to 5.
  ```bash
  $ cut -d '|' --complement -f -5 emp.dat
  ```
  - **Output:**
    ```plaintext
    gender
    female
    male
    female
    male
    female
    ```

---

```bash
akshay@myubuntu:~/Desktop/operations/session38$ cd ..
akshay@myubuntu:~/Desktop/operations$ mkdir session39
akshay@myubuntu:~/Desktop/operations$ cd session39
akshay@myubuntu:~/Desktop/operations/session39$ gedit emp.dat
akshay@myubuntu:~/Desktop/operations/session39$ cat emp.dat 
eno|ename|esal|eaddr|dept|gender
100|sunny|1000|mumbai|admin|female
200|bunny|2000|chennai|sales|male
300|chinny|3000|delhi|accounting|female
400|vinny|4000|hyderabad|admin|male
500|pinny|5000|mumbai|sales|female
akshay@myubuntu:~/Desktop/operations/session39$ cut -c 9 emp.dat 
e
y
y
n
y
y
akshay@myubuntu:~/Desktop/operations/session39$ cut -c 5-9 emp.dat # display 5th to 9th character in every row 
ename
sunny
bunny
chinn
vinny
pinny
akshay@myubuntu:~/Desktop/operations/session39$ cut -c 5- emp.dat # display 5th to last
ename|esal|eaddr|dept|gender
sunny|1000|mumbai|admin|female
bunny|2000|chennai|sales|male
chinny|3000|delhi|accounting|female
vinny|4000|hyderabad|admin|male
pinny|5000|mumbai|sales|female
akshay@myubuntu:~/Desktop/operations/session39$ cut -c -3 emp.dat
eno
100
200
300
400
500
akshay@myubuntu:~/Desktop/operations/session39$ cut -c 3-5,7-10 emp.dat
o|eame|
0|snny|
0|bnny|
0|cinny
0|vnny|
0|pnny|
akshay@myubuntu:~/Desktop/operations/session39$ cut -d "|" -f 3 emp.dat 
esal
1000
2000
3000
4000
5000
akshay@myubuntu:~/Desktop/operations/session39$ cut -d "|" -f 2-3 emp.dat 
ename|esal
sunny|1000
bunny|2000
chinny|3000
vinny|4000
pinny|5000
akshay@myubuntu:~/Desktop/operations/session39$ cut -d "|" -f 2- emp.dat 
ename|esal|eaddr|dept|gender
sunny|1000|mumbai|admin|female
bunny|2000|chennai|sales|male
chinny|3000|delhi|accounting|female
vinny|4000|hyderabad|admin|male
pinny|5000|mumbai|sales|female
akshay@myubuntu:~/Desktop/operations/session39$ cut -d "|" -f 1,3,5 emp.dat 
eno|esal|dept
100|1000|admin
200|2000|sales
300|3000|accounting
400|4000|admin
500|5000|sales
akshay@myubuntu:~/Desktop/operations/session39$ cut -d "|" --complement -f 1,3,5 emp.dat 
ename|eaddr|gender
sunny|mumbai|female
bunny|chennai|male
chinny|delhi|female
vinny|hyderabad|male
pinny|mumbai|female
akshay@myubuntu:~/Desktop/operations/session39$ cut -d "|" --complement -f -5 emp.dat 
gender
female
male
female
male
female
akshay@myubuntu:~/Desktop/operations/session39$
```