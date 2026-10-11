### Additional Patterns Supported by `egrep` but Not `grep`

1. **`(|)`**  
   Matches any of the strings in the given list.  
   ```bash
   $ egrep '(unix|java|oracle)' demo.txt
   ```
   **Example:**  
   If `demo.txt` contains:  
   ```text
   unix is popular  
   java is versatile  
   oracle is powerful  
   linux is everywhere  
   ```  
   **Output:**  
   ```text
   unix is popular  
   java is versatile  
   oracle is powerful  
   ```

2. **`{m}`**  
   Matches an exact number of the preceding characters.  
   ```bash
   $ egrep '[6-9][0-9]{9}' demo.txt
   ```
   **Description:**  
   Searches for 10-digit mobile numbers starting with digits 6–9.  
   **Example:**  
   If `demo.txt` contains:  
   ```text
   9876543210  
   12345  
   7890123456  
   ```  
   **Output:**  
   ```text
   9876543210  
   7890123456  
   ```

3. **`{m,n}`**  
   Matches the preceding character a minimum of `m` times and a maximum of `n` times.  
   ```bash
   $ egrep '[0-9]{1,5}' demo.txt
   ```
   **Description:**  
   Searches for numbers containing between 1 and 5 digits.  
   **Example:**  
   If `demo.txt` contains:  
   ```text
   123  
   67890  
   1234567  
   ```  
   **Output:**  
   ```text
   123  
   67890  
   ```

4. **`{m,}`**  
   Matches the preceding character a minimum of `m` times with no maximum limit.  
   ```bash
   $ egrep '[0-9]{3,}' demo.txt
   ```
   **Description:**  
   Searches for numbers with at least 3 digits.  
   **Example:**  
   If `demo.txt` contains:  
   ```text
   12  
   123  
   45678  
   ```  
   **Output:**  
   ```text
   123  
   45678  
   ```

---

### Retrieve Date Values in Specific Formats

#### **Input File (`input.txt`):**  
```text
Durga 28-05-1947  
Ravi 23/07/1957  
shiva 23-09-2015  
kljdslgklfjd  
dsklfjakdlsfjkl  
sdlkfskfjdklsjfdkl  
```

#### **Command:**  
```bash
$ egrep -o '\<[0123][0-9][-/][01][0-9][-/][0-9]{4}\>' input.txt
```

#### **Output:**  
```text
28-05-1947  
23/07/1957  
23-09-2015  
```

---

### Count the Number of Directories in the Current Working Directory

1. **Command:**  
   ```bash
   $ ls -l | grep '^d' | wc -l
   ```  

2. **Alternative Command:**  
   ```bash
   $ ls -F | grep '/$' | wc -l
   ```

---

### Count the Number of Files in the Current Working Directory

1. **Command:**  
   ```bash
   $ ls -l | grep '^-' | wc -l
   ```

---

### Count the Number of Link Files in the `/etc` Directory

1. **Command:**  
   ```bash
   $ ls -F /etc | grep '@$' | wc -l
   ```

---

### Display All Executable Files in the `/bin` Directory

1. **Command:**  
   ```bash
   $ ls -F /bin | grep '*$'
   ```

2. **Count the Number of Executable Files:**  
   ```bash
   $ ls -F /bin | grep '*$' | wc -l
   ```  

```shell
akshay@myubuntu:~/Desktop/operations/session37$ gedit demo.txt 
akshay@myubuntu:~/Desktop/operations/session37$ cd ..
akshay@myubuntu:~/Desktop/operations$ cd session38
akshay@myubuntu:~/Desktop/operations/session38$ gedit demo.txt
akshay@myubuntu:~/Desktop/operations/session38$ gedit demo.txt
akshay@myubuntu:~/Desktop/operations/session38$ egrep '[0-9]{1,5}' demo.txt 
My car number is MH 14 BH 7777
1
12
123
1234
12345
123456
akshay@myubuntu:~/Desktop/operations/session38$ egrep '[0-9]{3,}' demo.txt 
My car number is MH 14 BH 7777
123
1234
12345
123456
akshay@myubuntu:~/Desktop/operations/session38$ gedit input.txt
akshay@myubuntu:~/Desktop/operations/session38$ egrep -w '[0123][0-9][-/][01][0-9][-/][0-9]{4}' input.txt 
Durga 28-05-1947
Ravi 21-04-2005
Shiva 10-08-1995
Pavan 21/04/2008
akshay@myubuntu:~/Desktop/operations/session38$ egrep -w -o '[0123][0-9][-/][01][0-9][-/][0-9]{4}' input.txt 
28-05-1947
21-04-2005
10-08-1995
21/04/2008
akshay@myubuntu:~/Desktop/operations/session38$ ls -l
total 8
-rw-rw-r-- 1 akshay akshay 1083 Nov 29 14:31 demo.txt
-rw-rw-r-- 1 akshay akshay  138 Nov 29 14:33 input.txt
akshay@myubuntu:~/Desktop/operations/session38$ cd ..
akshay@myubuntu:~/Desktop/operations$ ls -l | grep '^d' | wc -l
4
akshay@myubuntu:~/Desktop/operations$ ls -l
total 16
drwxrwxr-x 3 akshay akshay 4096 Nov 25 19:49 session35
drwxrwxr-x 2 akshay akshay 4096 Nov 25 20:09 session36
drwxrwxr-x 2 akshay akshay 4096 Nov 29 14:30 session37
drwxrwxr-x 2 akshay akshay 4096 Nov 29 14:33 session38
akshay@myubuntu:~/Desktop/operations$ ls -F | grep '/$' | wc -l
4
akshay@myubuntu:~/Desktop/operations$ ls -l | grep '^-'
akshay@myubuntu:~/Desktop/operations$ cd session38
akshay@myubuntu:~/Desktop/operations/session38$ ls -l | grep '^-' | wc -l
2
akshay@myubuntu:~/Desktop/operations/session38$ cd /etc
akshay@myubuntu:/etc$ cd ..
akshay@myubuntu:/$ pwd
/
akshay@myubuntu:/$ cd home/
akshay@myubuntu:/home$ ls
akshay
akshay@myubuntu:/home$ cd akshay/
akshay@myubuntu:~$ cd Desktop/
akshay@myubuntu:~/Desktop$ cd operations/
akshay@myubuntu:~/Desktop/operations$ cd session38
akshay@myubuntu:~/Desktop/operations/session38$ ls -F /etc | grep '@$'
localtime@
mtab@
os-release@
printcap@
resolv.conf@
rmt@
vconsole.conf@
vtrgb@
akshay@myubuntu:~/Desktop/operations/session38$ ls -F /etc | grep '@$' | wc -l # Total number of link files present insideetc dir
8
akshay@myubuntu:~/Desktop/operations/session38$ ls -F /bin | grep '*$' | wc -l # Total number of executable files
0
```   