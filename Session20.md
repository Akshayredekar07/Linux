## Creation of Link Files

There are 2 types of link files:
1. **Hard Link files**
2. **Soft Link files**

### 1. Hard Link Files:
- It is just another name for the same exact file.
- We can create a hard link file by using the `ln` command.
  ```bash
  ln originalfile hardlinkfile
  ```
```bash
akshay@Ubuntu:~/Desktop$ cat file1.txt 
Apple
Banana
Orange
Mango
akshay@Ubuntu:~/Desktop$ ln file1.txt file1ln.txt
akshay@Ubuntu:~/Desktop$ ls
file1ln.txt  file1.txt
akshay@Ubuntu:~/Desktop$ ls -l
total 8
-rw-rw-r-- 2 akshay akshay 26 Sep 29 09:50 file1ln.txt
-rw-rw-r-- 2 akshay akshay 26 Sep 29 09:50 file1.txt
akshay@Ubuntu:~/Desktop$ ls -li
total 8
918179 -rw-rw-r-- 2 akshay akshay 26 Sep 29 09:50 file1ln.txt
918179 -rw-rw-r-- 2 akshay akshay 26 Sep 29 09:50 file1.txt

#Added some more content in file1.txt

akshay@Ubuntu:~/Desktop$ ls -li
total 8
918179 -rw-rw-r-- 2 akshay akshay 57 Sep 29 09:53 file1ln.txt
918179 -rw-rw-r-- 2 akshay akshay 57 Sep 29 09:53 file1.txt
akshay@Ubuntu:~/Desktop$ cat file1.txt
Apple
Banana
Orange
Mango
Java
Python
Devops
DataScience
akshay@Ubuntu:~/Desktop$ cat file1ln.txt
Apple
Banana
Orange
Mango
Java
Python
Devops
DataScience
```
  **Example**: `ln file1.txt file1ln.txt`  
  Here, `file1.txt` is the original file and `fileln.txt` is the hard link file.

**Important conclusions about hard link files:**
1. Both the original file and the hard link file have the same inode number, same size, and the same timestamp.
2. If we delete the original file, there is no effect on the hard link file.

### 2. Soft Link Files:
- A soft link is a pointer to another file, similar to a Windows shortcut.
- It is also known as a symbolic link.
- We can create a soft link file using the `ln` command with the `-s` option.
  
  ```bash
  ln -s originalfile softlinkfile
  ```
  **Example**: 
  ```bash
  ln -s file1.txt file2.txt  
  ```
  Here, `file1.txt` is the original file and `file2.txt` is the link file.

```bash
akshay@Ubuntu:~/Desktop$ gedit file1.txt
akshay@Ubuntu:~/Desktop$ ln -s file1.txt file1ln.txt 
akshay@Ubuntu:~/Desktop$ ls -l
total 4
lrwxrwxrwx 1 akshay akshay  9 Sep 29 10:05 file1ln.txt -> file1.txt
-rw-rw-r-- 1 akshay akshay 26 Sep 29 10:05 file1.txt
```

**Important conclusions about soft link files:**
1. The original file and the soft link file have different inode numbers, different file sizes, and different timestamps.
2. Usually, the soft link file has a smaller file size than the original file.
3. If we delete the original file, the soft link file becomes useless.

**Link files for directories:**
- We cannot create a hard link for directories because it breaks the Linux file system. Having two root directories is meaningless.
  ```bash
  $ ln dir1 dir2
  ln: dir1: hard link not allowed for directory
  ```
- We can create a soft link for directories:
  ```bash
  $ ln -s dir1 dir2
  ```

**Note**: For files, we can create both hard and soft links. But for directories, we can create only soft links, not hard links.

### Case Study:
Assume `dir1` contains `dir2`, and `dir2` contains a soft link `dir3` pointing to `dir1`.
```bash
dir1 -> dir2 -> dir3
```

Commands:
```bash
$ mkdir -p dir1/dir2
$ cd dir1/dir2
$ ln -s ~/Desktop/dir1 dir3
```

This will form a loop.

**Note**: When creating link files, there is a chance of forming loops. Take special care.

---

**Q1 Which of the following is valid about Hard Links?**

A. Inode number is different when compared to that of the original file.  
B. File size is different when compared to that of the original file.  
C. It will become useless if we delete the original file.  
D. Inode number, file size, and timestamp are the same when compared to that of the original file.  
**Ans**: D

---

**Q2 Which of the following is a valid way to create a soft link for `sunny.jpg` present in the Pictures directory?**

A. `ln ~/Pictures/sunny.jpg newimg.jpg`  
B. `ln -s ~/Pictures/sunny.jpg newimg.jpg`  
C. `ln newimg.jpg ~/Pictures/sunny.jpg`  
D. `ln -s newimg.jpg ~/Pictures/sunny.jpg`  
**Ans**: B

---

### Q3 Can we create both hard and soft links to directories?
A. True  
B. False  
**Ans**: B

---

- If we perform any changes to the **original file**, those changes will be reflected in the **link file**.
- Similarly, if we perform any changes to the **link file**, those changes will be reflected in the **original file**.
- This behavior is true for **both hard links** and **soft links** because:
  - **Hard Links**: Both the original file and the hard link share the same data blocks.
  - **Soft Links**: The soft link points directly to the original file.


---

| **Feature**                       | **Hard Link**                                                  | **Soft Link (Symbolic Link)**                                      |
|------------------------------------|----------------------------------------------------------------|-------------------------------------------------------------------|
| **Definition**                     | Another name for the same file.                                | A pointer to another file, similar to a shortcut.                  |
| **Inode Number**                   | Same as the original file.                                      | Different from the original file.                                  |
| **File Size**                      | Same as the original file.                                      | Different (usually smaller) than the original file.                |
| **Timestamp**                      | Same as the original file.                                      | Different from the original file.                                  |
| **Effect of Deleting Original File**| No effect, the hard link still points to the file data.         | Soft link becomes useless.                                         |
| **Allowed for Directories**        | Not allowed (breaks Linux file system).                         | Allowed, soft links to directories can be created.                 |
| **Creation Command**               | `ln originalfile hardlinkfile`                                  | `ln -s originalfile softlinkfile`                                  |
| **Can Create Loops**               | No, cannot form loops.                                          | Yes, can form loops when pointing back to parent directories.      |
| **Linking Across Filesystems**     | Cannot create across different filesystems.                     | Can create across different filesystems.                           |
| **Use Case**                       | Provides redundancy, protects data if original file is deleted. | Useful for shortcuts, symbolic links for easier navigation.        |


---

**Note**: If we make any changes to the content of the original file, those changes will be reflected in the link file. Similarly, if we make changes to the link file, those changes will be reflected in the original file. This is true for both hard and soft links.
