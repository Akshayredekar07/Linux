
## Topic-19: Compression and Uncompression of Files (tar, gzip, gunzip, bzip2, bunzip2)

In system administration, it is often necessary to pack and compress a group of files. The main advantages are:

1. Improved memory utilization
2. Easier transportation
3. Reduced download times
4. And more...

The compression process generally involves the following two steps:

1. **Creation of Archive File**
2. **Application of Compression Algorithms on the Archive File**

### 1. Creation of Archive File

We can group multiple files and directories into a single archive file using the `tar` command. 

`tar` stands for *tape archive*.

### A Creating a tar File
To create a tar file containing specific files:
```bash
tar -cvf demo.tar file1.txt file2.txt file3.txt
```

To include all files in the current directory:
```bash
tar -cvf demo.tar *
```

### B Displaying the Table of Contents of a tar File
To view the contents of a tar file:
```bash
tar -tvf demo.tar
```

### C Extracting the Contents of a tar File
To extract the contents of a tar file:
```bash
tar -xvf demo.tar
```

### 2. Applying Compression Algorithms on the Archive File

There are multiple compression and decompression algorithms available:

1. **gzip** - Fast but with less compression power
2. **bzip2** - Slower but provides higher compression power


### Compression and Decompression Using `gzip`

### 1 To Compress a tar File
```bash
$ gzip demo.tar
```
This command creates a compressed file `demo.tar.gz`.

### 2 To Uncompress a gz File
```bash
$ gzip -d demo.tar.gz
# or
$ gunzip demo.tar.gz
```
This command restores the original `demo.tar` file.

### Compression and Decompression Using `bzip2`

### 1 To Compress a tar File
```bash
$ bzip2 demo.tar
```
This creates a compressed file `demo.tar.bz2`.

### 2 To Uncompress a bz2 File
```bash
$ bunzip2 demo.tar.bz2
```

### Creating and Compressing a tar File in a Single Command

### 1 Using `gzip` Compression
To create and compress a tar file in one command:
```bash
$ tar -cvzf demo.tar.gz *.txt
```
- The `z` option compresses the file.
- This creates `demo.tar.gz`, which is already compressed.

To uncompress and extract:
```bash
$ tar -xvzf demo.tar.gz
```

### 2 Using `bzip2` Compression
Instead of `z`, use `j` for bzip2 compression:
```bash
$ tar -cvjf demo.tar.bz2 *.txt
```
- The `j` option compresses the file.
- This creates `demo.tar.bz2`, which is already compressed.

To uncompress and extract:
```bash
$ tar -xvjf demo.tar.bz2
```

---

### Use Case: Backup of User Home Directory

Example for creating a backup of the user home directory:

```bash
$ pwd
/home/durgasoft
$ tar -cvzf backup.tar *
$ mkdir newhome
$ mv backup.tar newhome
$ cd newhome
$ tar -xvzf backup.tar
```
```