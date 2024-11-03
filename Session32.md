# Magic Assignment

### Creating Directories and Files

To create a directory structure and files, you can use the following commands:

```bash
$ mkdir magic
$ mkdir magic/dir{1..100}
$ touch magic/dir{1..100}/file{1..100}.txt
```

Alternatively, you can combine the commands into one:

```bash
$ mkdir magic; mkdir magic/dir{1..100}; touch magic/dir{1..100}/file{1..100}.txt
```

### Creating a Specific File

To create a file named `test.txt` in a randomly chosen directory:

```bash
$ touch magic/dir$(shuf -i 1-100 -n 1)/test.txt
```

### Finding and Moving Files

1. To find the `test.txt` file:

   ```bash
   $ find magic -type f -name 'test.txt'
   ```

2. To move `test.txt` to the Desktop:

   ```bash
   $ find magic -type f -name 'test.txt' -exec mv {} ~/Desktop \;
   ```

3. To remove all `.txt` files in the `magic` directory:

   ```bash
   $ find magic -type f -name '*.txt' -exec rm {} \;
   ```

---

## Quiz Questions

### Q4: The Find Command Uses a Database to Search Files and Directories
- A) True
- B) False

**Answer:** B

### Q5: To find Files and Directories inside /dev Folder and Limit its Search to only 2 Levels of Depth?
- A) `find -start /dev -depth 2`
- B) `find /dev -depth 2`
- C) `find /dev -maxdepth 2`

**Answer:** C

### Q6: To find only Directories inside /dev Folder and Limit its Search to only 2 Levels of Depth?
- A) `find /dev -maxdepth 2 -type f`
- B) `find /dev -maxdepth 2 -type d`
- C) `find /dev -type d -maxdepth 2`

**Answer:** B

### Q7: To find only Files Starting from Root Directory (/) where File Name Ends with .txt?
- A) `find / '*.txt'`
- B) `find / -type d -name '*.txt'`
- C) `find / -type f -name '*.txt'`

**Answer:** C

---

### Difference between `find` and `locate` Commands

| Feature | find | locate |
|---|---|---|
| Search Method | Searches directly in the file system | Searches in a database |
| Options | Numerous options for customization | Very few options |
| Search Criteria | Name, type, size, depth, age, user, group, permissions, etc. | Name and permissions |
| Depth of Search | Can be reduced | Cannot be reduced |
| Accuracy | Accurate as it searches directly in the file system | May not be accurate due to database updates |
| Deleted Files | Doesn't include deleted files | May include deleted files |
| Using Search Results | `-exec` option for further actions | No direct way to use results |
| Speed | Slower | Faster |
