
## File and Directory Permissions: Examples and Use Cases

### Read Permission for Files

- Description:  
  If a file does not have read permission, commands like `cat`, `head`, `tail`, `more`, and `less` will not work.  

Example:  
```bash
$ ls -l
-rw-r--r-- 1 durgasoft durgasoft 34 Nov 28 20:56 demo.txt
$ cat demo.txt
This is file content at beginning
$ chmod u-r demo.txt
$ ls -l
--w-r--r-- 1 durgasoft durgasoft 34 Nov 28 20:56 demo.txt
$ cat demo.txt
cat: demo.txt: Permission denied
```

---

### Write Permission for Files

- Description:  
  Without write permission, the file content cannot be modified.  

Example:  
```bash
$ chmod u-w demo.txt
$ ls -l
-r--r--r-- 1 durgasoft durgasoft 66 Nov 28 21:04 demo.txt
$ cat >> demo.txt
bash: demo.txt: Permission denied
$ chmod u+w demo.txt
$ cat >> demo.txt
# Content can now be modified.
```

---

### Execute Permission for Files

- Description:  
  Without execute permission, a file cannot be executed as a program.  

Example:  
```bash
$ cat > first.sh
echo "Hello Friends..."
echo "File Permissions are very important"
$ chmod u+x first.sh
$ ./first.sh
Hello Friends...
File Permissions are very important
```

---

### Read Permission for Directories

- Description:  
  Read permission on a directory allows listing its contents using the `ls` command.  

Example:  
```bash
$ ls dir1
demo.txt first.sh
$ chmod u-r dir1
$ ls dir1
ls: cannot open directory 'dir1': Permission denied
```

---

### Write Permission for Directories

- Description:  
  Write permission on a directory allows creating or removing files in it.  

Example:  
```bash
$ chmod u-w dir1
$ touch dir1/newfile.txt
touch: cannot touch 'dir1/newfile.txt': Permission denied
$ rm dir1/demo.txt
rm: cannot remove 'dir1/demo.txt': Permission denied
$ chmod u+w dir1
$ touch dir1/newfile.txt
$ rm dir1/demo.txt
```

---

### Execute Permission for Directories

- Description:  
  Execute permission on a directory allows entering the directory using the `cd` command.  

Example:  
```bash
$ chmod u-x dir1
$ cd dir1
bash: cd: dir1: Permission denied
$ chmod u+x dir1
$ cd dir1
```

Note:  
- Without execute permission, read and write operations in the directory cannot be performed because the user cannot enter the directory.  
- A file cannot be executed if the user lacks read permission, even if execute permission is granted.  

```bash
$ chmod u-x dir1
$ ls dir1
ls: cannot access 'dir1/first.sh': Permission denied
ls: cannot access 'dir1/newfile.txt': Permission denied
$ touch dir1/demo.txt
touch: cannot touch 'dir1/demo.txt': Permission denied
$ rm dir1/first.sh
rm: cannot remove 'dir1/first.sh': Permission denied
```


```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ cat file1.txt

#Output:
cat: file1.txt: Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u+x file1.txt
akshay@myubuntu:~/Desktop/operations/session43$ cat file1.txt

#Output:
cat: file1.txt: Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u+r file1.txt
akshay@myubuntu:~/Desktop/operations/session43$ cat file1.txt

#Output:
This is sample file created for file permission  
read  
write  
execute  
+  
-  
=  
user  
group  
others  
all
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u-w file1.txt
akshay@myubuntu:~/Desktop/operations/session43$ cat >> file1.txt

#Output:
bash: file1.txt: Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ gedit test.sh
akshay@myubuntu:~/Desktop/operations/session43$ ls -l test.sh

#Output:
-rw-rw-r-- 1 akshay akshay 56 Dec  1 16:44 test.sh
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ ./test.sh

#Output:
bash: ./test.sh: Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u+x test.sh
akshay@myubuntu:~/Desktop/operations/session43$ ./test.sh

#Output:
Hello friends!  
Sun Dec  1 04:44:56 PM IST 2024  
  
   December 2024  
Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7  
 8  9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28  
29 30 31
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u-r test.sh
akshay@myubuntu:~/Desktop/operations/session43$ ./test.sh

#Output:
bash: ./test.sh: Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u+r test.sh
akshay@myubuntu:~/Desktop/operations/session43$ ./test.sh

#Output:
Hello friends!  
Sun Dec  1 04:48:35 PM IST 2024  
*  
   December 2024  
Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7  
 8  9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28  
29 30 31  
Happy Learning!
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ mkdir dir1
akshay@myubuntu:~/Desktop/operations/session43$ mkdir dir1/dir2
akshay@myubuntu:~/Desktop/operations/session43$ mkdir dir1/abc.txt

#Output:
No #Output (directories created successfully).
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ tree dir1

#Output:
dir1  
├── abc.txt  
└── dir2  

3 directories, 0 files
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u-w dir1
akshay@myubuntu:~/Desktop/operations/session43$ touch dir1/b.txt

#Output:
touch: cannot touch 'b.txt': Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u+w dir1
akshay@myubuntu:~/Desktop/operations/session43$ touch dir1/b.txt

#Output:
No #Output (file created successfully).
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u-x dir1
akshay@myubuntu:~/Desktop/operations/session43$ cd dir1/

#Output:
bash: cd: dir1/: Permission denied
```

```bash
#Command:
akshay@myubuntu:~/Desktop/operations/session43$ chmod u+x dir1/
akshay@myubuntu:~/Desktop/operations/session43$ cd dir1/

#Output:
No #Output (directory accessed successfully).
```