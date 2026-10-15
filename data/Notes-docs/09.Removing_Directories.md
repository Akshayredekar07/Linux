
# Linux commands for How to Remove Directories

We can remove directories by using the `rmdir` command.

1. `$ rmdir dir1`  
   - To remove an empty directory `dir1`

2. `$ rmdir dir1 dir2 dir3`  
   - To remove multiple empty directories

**Note**: The `rmdir` command will only work for empty directories. If the directory is not empty, we will get an error. We cannot use `rmdir` for files. Therefore, the `rmdir` command is often considered less useful in Linux.

```bash
akshay@Ubuntu:~/Documents/DurgaSoft_Linux/dir1$ rmdir dir1
rmdir: failed to remove 'dir1': No such file or directory
```

If the directory is not empty, we should use the `rm` command. All internal contents will also be removed. The `rm` command works for files as well, so it is recommended over `rmdir`.

```bash
Akshay@Ubuntu:~/Documents/DurgaSoft_Linux/dir1$ rm dir1
rm: cannot remove 'dir1': No such file or directory
```

When using the `rm` command for directories, we should use the `-r` or `-R` option (case insensitive).

```bash
$ rm -r heros
$ rm -R heros
```

**Note**: In Linux, there is no way to undo a file or directory deletion. Once deleted, it is impossible to retrieve them. Therefore, special care is required while using the `rm` command. The following command is considered the most dangerous in Linux, as it removes the entire file system:

```bash
$ rm -rf /
```

## Various Options with the `rm` Command:

1. **Interactive Option (-i)**:  
   While removing files and directories, if we want confirmation, use the `-i` option.

   ```bash
   akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ rm -ri dir1
   rm: descend into directory 'dir1'? y
   rm: remove regular empty file 'dir1/c.txt'? y
   rm: remove regular empty file 'dir1/b.txt'? y
   rm: remove directory 'dir1'? y
   ```

2. **Force Removal (-f)**:  
   To suppress error messages during removal, use the `-f` option. It is the opposite of `-i`.

   ```bash
   akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ rm -r dir77
   akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ rm -rf dir77
   akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ rm -rf dir99
   ```

   Even if `dir99` doesn't exist, there will be no error due to the use of the `-f` option.

3. **Verbose Option (-v)**:  
   To view the sequence of removals on the screen, use the `-v` option.

   ```bash
   akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ rm -r dir6
   akshay@Ubuntu:~/Documents/DurgaSoft_Linux$ rm -rv dir8
   removed directory 'dir8/c.txt'
   removed directory 'dir8/d.txt'
   removed directory 'dir8/a.txt'
   removed directory 'dir8/b.txt'
   removed directory 'dir8'
   ```

---

## Q1: What is the difference between the following two commands?

- `$ mkdir dir1/dir2/dir3`
- `$ mkdir -p dir1/dir2/dir3`

`mkdir dir1/dir2/dir3`:  
Only `dir3` will be created, and `dir1` and `dir2` must already exist. If they don't, this command will fail.

`mkdir -p dir1/dir2/dir3`:  
The `-p` option means creating the complete path. All three directories will be created.

---

## Q2: What is the advantage of using the `rm` command over the `rmdir` command when removing directories?

The `rmdir` command only works for empty directories, whereas the `rm` command works for both empty and non-empty directories. You can also use `rm` for files.

---

## Q3: Assume that `dir1` is an empty directory. Which of the following commands will remove `dir1`?

- `rm dir1`
- `remove dir1`
- `rmdir dir1`
- `del dir1`

**Answer**: `rmdir dir1`

---

## Q4: Assume that `dir1` is a non-empty directory. Which of the following commands will remove `dir1`?

- `rmdir dir1`
- `rm -R dir1`
- `rm -i dir1`
- `rm -f dir1`
- `rm -v dir1`

**Answer**: `rm -R dir1`

---

## Q5: Assume that `dir1` is a non-empty directory and `text1` is a text file. Which of the following commands will remove both `dir1` and `text1` successfully?

- `rm text1 dir1`
- `rm -v text1 dir1`
- `rm -R text1 dir1`

**Answer**: `rm -R text1 dir1`

---

## Q6: How to create a directory called `pythonclasses` in the `Videos` directory within the user's home directory?

```bash
mkdir ~/Videos/pythonclasses
```

---

## Q7: How to create a directory named `A`, inside that a directory `B`, and inside that a directory `C`?

```bash
mkdir -p A/B/C
```

---

## Q8: How many directories will be created after running the following command?

```bash
mkdir {a..c}{1..3}
```

**Answer**: Nine directories: `a1`, `a2`, `a3`, `b1`, `b2`, `b3`, `c1`, `c2`, `c3`.

---

## Q9: To create a directory named `Java Classes`, is the following command valid?

```bash
mkdir java classes
```

This command will create two directories: `java` and `classes`. To create a single directory with spaces in the name, use:

```bash
mkdir "java classes"
```

**Note**: It's not recommended to use spaces in file or directory names. Instead, use underscores, like `java_classes`.

**What is the advantage of using `rm` command over `rmdir` command while removing directories?**

* `rm` can work for any directory whether it is empty or not.
* `rmdir` can work only to remove empty directories.

**How to remove directories named dir1 to dir10?**

**Using `rm -r`:**
  ```bash
rm -r dir{1..10}
```
**Using `rmdir` (only for empty directories):**
```bash
rmdir dir{1..10}
```
**How to remove all empty directories that start with the letter "d"?**
```bash
rmdir d*
```
**How to remove all empty directories that start with "d" and end with "n"?**
```bash
rmdir d*n
```

**To Remove 3 Empty Directories dir2, dir4, dir6**
```bash
rmdir dir{2,4,6}
```

**To Remove Directoreis where Name Starts with 'd' OR 'x'**
```bash
rmdir [dx]*
```