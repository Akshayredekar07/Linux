## Creation of Hidden Files and Directories

- If any file starts with a `.` (dot), such a file is called a **hidden file**.
- If we don't want certain files to be displayed, we can create hidden files.
- Hidden files are meant for hiding data. All system files required by the kernel are hidden files.
- We can create hidden files just like normal files; the only difference is that the file name should start with a dot (`.`).

```bash
touch .securefile1.txt
```

```bash
cat > .securefile2.txt
```

- To view the secure files use the option `-l` after ls command

```bash
ls -a
```
- Editing of hidden files also possible just like normal files

```bash
gedit .securefile1.txt
```

- Even by using editors also we can create hidden files.

- We can create hidden directories also just like normal 
directories.
```bash
mkdir .db_info  
```

**Note:** By using hidden files and directories we may not get full security. To make more secure, we have to use proper permissions. For this, we should use the `chmod` command.

### Interconversion of Normal Files and Hidden Files: 

- Based on our requirement, we can convert a normal file into a hidden file and vice versa.  

- To convert a normal file `a.txt` into a hidden file:

```bash
mv a.txt .a.txt
```

Similarly, for directories:

```bash
mv dir1 .dir1
mv .dir1 dir1
```


