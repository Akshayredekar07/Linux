## Comparing Files

We can compare the data of two files by using the following commands:

1. **cmp**
2. **diff**
3. **sdiff**
4. **vidiff**
5. **comm**

### 1. cmp Command:
It compares files byte by byte.

```bash
cmp file1.txt file2.txt
```

If the content is the same, there will be no output.  
If the content is different, it provides information about only the first difference, including the byte number and line number.

```bash
$ cmp a.txt c.txt
a.txt c.txt differ: byte 7, line 2
```

**Note:** The `cmp` command only shows the first difference and not all differences.

 ### 2. diff Command:
It shows all differences in the content.

```bash
diff file1.txt file2.txt
```

If the content is the same, there will be no output.  
If the content is different, it will show all differences.

```bash
$ diff a.txt b.txt
$ diff a.txt c.txt
2,3c2,3
< Bunny
< Chinny
---
> bunny
b  
```
For the `diff` command, we can use the following options:

- **-q**: Shows a message when files are different.
- **-s**: Shows a message when files are the same (identical).
- **-y**: Shows a comparison line by line (parallel comparison).

```bash
$ diff -q a.txt c.txt
Files a.txt and c.txt differ

$ diff -s a.txt b.txt
Files a.txt and b.txt are identical

$ diff -y a.txt c.txt
Sunny  Sunny
Bunny  | bunny
Chinny | chinny
Vinny  Vinny
Pinny  Pinny
```

If we want to suppress common lines, we should use the `--suppress-common-lines` option with the `-y` option.

```bash
$ diff -y --suppress-common-lines a.txt c.txt
Bunny  | bunny
Chinny | chinny
```

### 3 sdiff Command:
We can use the `sdiff` command for side-by-side comparison (parallel comparison).

```bash
$ sdiff a.txt b.txt
Sunny  Sunny
Bunny  Bunny
Chinny Chinny
Vinny  Vinny
Pinny  Pinny

$ sdiff a.txt c.txt
Sunny  Sunny
Bunny  | bunny
Chinny | chinny
Vinny  Vinny
Pinny  Pinny
```

**Note:** The `sdiff` command and the `diff` command with the `-y` option are the same.

### 4 vimdiff Command:
- It will highlight differences directly in **vim**.
- To use this command, we need to install **vim** using the following command:

```bash
sudo apt install vim
```

- To compare files:

```bash
vimdiff a.txt b.txt
```

- Key commands in **vimdiff**:
  - `ctrl+w+w`: Switch to the next window.
  - `:q`: Close the current window.
  - `:qa`: Close all windows.
  - `:qa!`: Forcefully close all windows.

### 5 comm Command:
Using the `comm` command, we can compare the data of two files.  
The result is displayed in 3 columns:
- **Column 1**: Data present only in `file1.txt` but not in `file2.txt`.
- **Column 2**: Data present only in `file2.txt` but not in `file1.txt`.
- **Column 3**: Common data present in both files.

```bash
comm file1.txt file2.txt
```

For example:

```bash
$ comm a.txt c.txt
Sunny
bunny
Bunny
chinny
Chinny
Vinny
Pinny
```

With the `comm` command, we can use the following options:
- **-1**: Do not display column 1.
- **-2**: Do not display column 2.
- **-3**: Do not display column 3.
- **-12**: Do not display both columns 1 and 2.

**Note:** These comparison commands—`cmp`, `diff`, `sdiff`, `vimdiff`, `comm`—can be used to compare files across different builds, making them highly versatile.

"Comparison is the thief of joy." – Theodore Roosevelt. However, when it comes to comparing files, it's a necessary skill!
