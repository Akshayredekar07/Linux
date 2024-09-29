## Copying of Files

- To copy a file:
  ```bash
  cp file1.txt file2.txt
  ```
  - If `file2.txt` does not exist, it will be created, and the content will be copied from `file1.txt`.
  - If `file2.txt` already exists and contains data, its data will be overwritten with the content of `file1.txt`.

- **Interactive Mode (-i option)**:
  - If you want confirmation before overwriting, use the `-i` option (interactive):
    ```bash
    cp -i file1.txt file2.txt
    ```
    Example:
    ```bash
    cp -i a.txt b.txt
    cp: overwrite 'b.txt'?
    ```

- **Verbose Mode (-v option)**:
  - To see verbose output (showing what is being copied), use the `-v` option:
    ```bash
    cp -v file1.txt file2.txt
    ```
    Example:
    ```bash
    cp -v a.txt b.txt
    'a.txt' -> 'b.txt'
    ```

- **Copying Multiple Files**:
  - You can copy multiple files to a directory, but not to a single file:
    ```bash
    cp file1.txt file2.txt file3.txt directory/
    ```

  - **Note**: To concatenate multiple files into one, use the `cat` command, not `cp`:
    - Invalid:
      ```bash
      cp a.txt b.txt c.txt d.txt
      ```
      This gives the error: `cp: target 'd.txt' is not a directory`.

    - Valid:
      ```bash
      cat a.txt b.txt c.txt > d.txt
      ```


### Moving and Renaming Directories

Both moving and renaming can be performed using the `mv` command.

**1. Renaming Files:**
- To rename a file:
  ```bash
  mv oldname newname
  ```
  Example:
  ```bash
  mv file1.txt file2.txt
  ```
  This renames `file1.txt` to `file2.txt`.

**2. Renaming Directories:**
- To rename a directory:
  ```bash
  mv dir1 dir2
  ```
  This renames `dir1` to `dir2`.

**3. Moving Files from One Directory to Another:**

- To move all files from `dir1` to `dir2`:

  ```bash
  mv dir1/* dir2
  ```
  After executing this command, `dir1` will be empty, and its files will be moved to `dir2`.

**4. Moving an Entire Directory to Another Directory:**
- To move the entire `dir1` to `dir2`:
  ```bash
  mv dir1 dir2
  ```
  This moves `dir1` (and its contents) into `dir2`.

**5. Confirmation Before Overwriting:**

- To get a confirmation prompt before overwriting files, use the `-i` option:

  ```bash
  mv -i a.txt d.txt dir1
  ```
  Example output:
  ```bash
  mv: overwrite 'dir1/a.txt'?
  ```

This provides a safeguard before overwriting files when moving them.


## Case Study

**Directories:**
- Source: `/home/durga/Desktop/x`
- Destination: `/home/durga/Desktop/y`

**Directory Creation Command:**
```bash
mkdir -p x/x1/x1{1,2} x/x2 y/y1/y1{1,2} y/y2
```

### Requirement 1:
Assume `file1.txt` is available inside the `x/x1/x11` directory, and we are currently in the user home directory. To copy this file to the `y/y2` directory, you can use either an absolute path or a relative path.

### Using Absolute Path:
To copy using the absolute path, you can use the following commands:

```bash
cp /home/durga/Desktop/x/x1/x11/file1.txt /home/durga/Desktop/y/y2/
```
or
```bash
cp ~/Desktop/x/x1/x11/file1.txt ~/Desktop/y/y2/
```

### Using Relative Path:
To copy using the relative path, you can use the following commands:

```bash
cp ./Desktop/x/x1/x11/file1.txt ./Desktop/y/y2/
```
or
```bash
cp Desktop/x/x1/x11/file1.txt Desktop/y/y2/
```

### Explanation:
- **Absolute Path**: Specifies the complete path to the file from the root directory.
- **Relative Path**: Specifies the path to the file relative to the current working directory.

### Requirement 2:
Assume `file1.txt` is available in the `x/x1/x11` directory, and we are currently in the user home directory. To move this file to the `y/y1/y11` directory, you can use either an absolute path or a relative path.

#### Using Absolute Path:
To move using the absolute path, use the following commands:

```bash
mv /home/durga/Desktop/x/x1/x11/file1.txt /home/durga/Desktop/y/y1/y11/
```
or
```bash
mv ~/Desktop/x/x1/x11/file1.txt ~/Desktop/y/y1/y11/
```

#### Using Relative Path:
To move using the relative path, use the following commands:

```bash
mv ./Desktop/x/x1/x11/file1.txt ./Desktop/y/y1/y11/
```
or
```bash
mv Desktop/x/x1/x11/file1.txt Desktop/y/y1/y11/
```



