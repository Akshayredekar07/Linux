# Find Command

The `find` command is used to locate files and directories in the file system. It offers more search options compared to the `locate` command, including:

1. Search only files
2. Search only directories
3. Search by name
4. Search by size
5. Use search results with other commands
6. Restrict search to a maximum depth

## Usage

### Basic Command

```bash
$ find
```

This command will find all files and directories in the current working directory and below in the Linux file system. This is the default behavior.

## Finding Files and Directories

### Specifying a Directory

You can find all files and directories in a specified directory and its subdirectories with the following commands:

```bash
$ find /dev
$ find /etc
```

### Using the `maxdepth` Option

By default, the `find` command searches through all depth levels. However, you can limit the search to a specific depth using the `-maxdepth` option.

#### Directory Structure Example

```plaintext
Desktop
|- file1.txt
|- level_1_dir
   |- file2.txt
   |- level_2_dir
      |- file3.txt
      |- level_3_dir
         |- file4.txt
         |- level_4_dir
            |- file5.txt
```

To create this structure, you can use:

```bash
$ mkdir -p level_1_dir/level_2_dir/level_3_dir/level_4_dir
$ touch file1.txt level_1_dir/file2.txt level_1_dir/level_2_dir/file3.txt level_1_dir/level_2_dir/level_3_dir/file4.txt level_1_dir/level_2_dir/level_3_dir/level_4_dir/file5.txt
```

#### Observing the Difference in Results

Execute the following commands to see the effect of `maxdepth`:

1. ```bash
   $ find . -maxdepth 1
   ```
2. ```bash
   $ find . -maxdepth 2
   ```
3. ```bash
   $ find . -maxdepth 3
   ```
4. ```bash
   $ find . -maxdepth 4
   ```
5. ```bash
   $ find . -maxdepth 100
   ```

### Notes

1. The `maxdepth` option requires a single dash (`-`), not a double dash (`--`):
   - `-maxdepth` → Valid
   - `--maxdepth` → Invalid

2. The `find` command can also locate hidden files and directories.


## Finding by Type

You can use the `-type` option with the `find` command to search for specific types of files:

- `-type f` → Find only files
- `-type d` → Find only directories

### Examples

#### Finding Files

```bash
$ find -type f
```

Output might include:

```plaintext
./level_1_dir/file2.txt
./level_1_dir/level_2_dir/file3.txt
./level_1_dir/level_2_dir/level_3_dir/level_4_dir/file5.txt
./level_1_dir/level_2_dir/level_3_dir/file4.txt
./file1.txt
./.securefile1.txt
```

#### Finding Directories

```bash
$ find -type d
```

Output might include:

```plaintext
.
./.db_info
./level_1_dir
./level_1_dir/level_2_dir
./level_1_dir/level_2_dir/level_3_dir
./level_1_dir/level_2_dir/level_3_dir/level_4_dir
```

### Important Note

You can use these options simultaneously, but the order matters. Always specify `-maxdepth` before `-type`:

- ```bash
  $ find -type f -maxdepth 2  # Generates a warning
  ```
- ```bash
  $ find -maxdepth 2 -type f  # No warnings
  ```

## Finding by Name

To find files and directories by name, use the `-name` option.

### Examples

1. Create test files:

   ```bash
   $ touch {A..D}.txt
   $ touch {A,B}{A,B}.txt
   ```

2. Search for files by name:

   ```bash
   $ find . -name 'A.txt'
   ```

3. Use wildcards for more complex searches:

   ```bash
   $ find . -name '?.txt'
   $ find . -name '??.txt'
   $ find . -name '*.txt'
   $ find . -maxdepth 2 -name '*.txt'
   ```

### Case-Insensitive Search

If you want to ignore case when searching, use the `-iname` option:

```bash
$ find -iname 'a.txt'
```


## Finding Files by Size

To find files based on their size, you can use the `-size` option with the `find` command. 

### Size Modifiers

- `+n` → greater than n
- `-n` → less than n
- `n` → exactly n
- `-empty` → find empty files or directories

### Examples

1. **List all file names where size is over 200 KB:**

   ```bash
   $ find / -type f -size +200k
   ```

   This command requires root privileges.

   To count the files, use:

   ```bash
   $ sudo find / -type f -size +200k | wc -l
   ```

2. **List all file names where size is over 200 KB but less than 4 MB:**

   ```bash
   $ find / -type f -size +200k -size -4M | wc -l
   ```

3. **List all file names where file size is less than 200 KB or more than 4 MB:**

   ```bash
   $ find / -type f -size -200k -o -size +4M | wc -l
   ```

   Here, `-o` means "or."

### Q1: Output of the Following Command

```bash
$ find / -type f -size -200k -size +4M | wc -l
```

**The answer should be:** `0`

### Using Search Results of Find Command

You can perform operations on the results of the `find` command using the `-exec` option.

- **Example:** To copy all files in the `/etc` folder where file size is less than 2 KB to the `dir1` directory on the Desktop:

   ```bash
   $ find /etc -type f -size -2k -exec cp {} dir1 \;
   ```

   Here, `{}` is a placeholder for the found files.

   If you want confirmation before executing the command, use the `-ok` option instead:

   ```bash
   $ find /etc -type f -size -2k -ok cp {} dir1 \;
   ```

This will prompt you for confirmation before each copy operation.

## Magic Assignment

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

To create a file named `sunny.txt` in a randomly chosen directory:

```bash
$ touch magic/dir$(shuf -i 1-100 -n 1)/sunny.txt
```

### Finding and Moving Files

1. To find the `sunny.txt` file:

   ```bash
   $ find magic -type f -name 'sunny.txt'
   ```

2. To move `sunny.txt` to the Desktop:

   ```bash
   $ find magic -type f -name 'sunny.txt' -exec mv {} ~/Desktop \;
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