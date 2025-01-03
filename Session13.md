
### Copying files:

To copy content from one file to another file:

Syntax
```bash
cp source_file destination_file
```

If destination_file does not exist then cp command will create itself and total content will be copied.

```bash
cp a.txt d.txt
```
Output
```bash
akshay@Ubuntu:~/Desktop$ cp a.txt d.txt  
akshay@Ubuntu:~/Desktop$ gedit d.txt  
akshay@Ubuntu:~/Desktop$ cat d.txt  
Hi how are you.  
```
If destination file already available and contains some data then data will be overwritten with new data

```bash
akshay@Ubuntu:~/Desktop$ cp a.txt c.txt  
akshay@Ubuntu:~/Desktop$ cat c.txt  
Hi how are you.
```
```bash
cp a.txt ~/Documents/z.txt
```
Output
```bash
akshay@Ubuntu:~/Documents$ cat z.txt  
Hi how are you.
```

**To Copy File to Directory:**
```bash
cp file1 file2 destination_dir
```
- file1 and file2 will be copied to destination_dir directory.

- Here we can specify any number of files, but last argument should be directory.

- destination_dir directory should be available already.

```bash
akshay@Ubuntu:~/Desktop$ ls  
a.txt  b.txt  c.txt  d.txt  x  y  
akshay@Ubuntu:~/Desktop$ mkdir destination_dir  
akshay@Ubuntu:~/Desktop$ cp a.txt b.txt c.txt destination_dir  
akshay@Ubuntu:~/Desktop$ cd destination_dir/  
akshay@Ubuntu:~/Desktop/destination_dir$ ls  
a.txt  b.txt  c.txt  
```

**3. To Copy all Files of One Directory to another Directory:**
```bash
cp  dir1/*   dir2
```
- All files of dir1 will be copied to dir2  
- But dir2 should be available already.

```bash
akshay@Ubuntu:~/Desktop$ ls dir1/  
k.txt  l.txt  m.txt  n.txt  
akshay@Ubuntu:~/Desktop$ cp dir1/* dir2  
akshay@Ubuntu:~/Desktop$ cd dir2  
akshay@Ubuntu:~/Desktop/dir2$ ls  
k.txt  l.txt  m.txt  n.txt  
```

**4. To Copy Total Directory to another Directory:**
```bash
cp dir1  dir2
```
```bash
akshay@Ubuntu:~/Desktop$ cp dir1 dir3  
cp: -r not specified; omitting directory 'dir1'
```

- Whenever we are copying one directory to another directory, compulsory we should use -r option.

```bash
cp -r dir1  dir2
```

- total dir1 will be copied to dir2

```bash
akshay@Ubuntu:~/Desktop$ tree dir3  
dir3  
└── dir1  
    ├── k.txt  
    ├── l.txt  
    ├── m.txt  
    └── n.txt

1 directory, 4 files
```

Note:  
If the destination directory (dir2) is already available then total dir1 will be copied to dir2. If the destination directory (dir2) is not already available, then the destination directory will be created and all files of source directory will be copied to destination directory but source directory won't be copied.

```bash
akshay@Ubuntu:~/Desktop$ cp -r dir1 dir4  
akshay@Ubuntu:~/Desktop$ tree dir4  
dir4  
├── k.txt  
├── l.txt  
├── m.txt  
└── n.txt

0 directories, 4 files
```

**5. To Copy Multiple Directories into a Directory:**

```bash
cp -r dir1 dir2 dir3 dir4 dir5
```
- dir5 must be present otherwise, cp: target 'dir5' is not a directory

```bash
akshay@Ubuntu:~/Desktop$ cp -r dir1 dir2 dir3 dir4 dir5  
cp: target 'dir5' is not a directory
```

```bash
akshay@Ubuntu:~/Desktop$ cp -r dir1 dir2 dir3 dir4 dir5  
cp: target 'dir5' is not a directory  
akshay@Ubuntu:~/Desktop$ mkdir dir5  
akshay@Ubuntu:~/Desktop$ cp -r dir1 dir2 dir3 dir4 dir5  
akshay@Ubuntu:~/Desktop$ tree dir5  
dir5  
├── dir1  
│   ├── k.txt  
│   ├── l.txt  
│   ├── m.txt  
│   └── n.txt  
├── dir2  
│   ├── k.txt  
│   ├── l.txt  
│   ├── m.txt  
│   └── n.txt  
├── dir3  
│   └── dir1  
│       ├── k.txt  
│       ├── l.txt  
│       ├── m.txt  
│       └── n.txt  
└── dir4  
    ├── k.txt  
    ├── l.txt  
    ├── m.txt  
    └── n.txt

5 directories, 16 files
```

- dir1, dir2, dir3 and dir4 will be copied to dir5

Q. Write Command to Copy Data from a.txt, b.txt, c.txt to d.txt?

$ cp a.txt b.txt c.txt d.txt :: It won't work.           
We will discuss solution in the next classes.

### Moving and Renaming Directories:

- Both moving and renaming activities can be performed by using single command: `mv`

**1. Renaming of files:**

syntax:
```bash
mv oldname newname
```
Eg:
```bash
mv file1.txt file2.txt
```
- file1.txt will be renamed to file2.txt

**2. Renaming of Directories:**  
```bash
mv dir1  dir1111
```
- dir1 will be renamed to dir1111

**3. Moving files to directory:** 

```bash
mv a.txt b.txt c.txt dir1
```
- a.txt, b.txt and c.txt will be moved to dir1 directory.

**4. Moving of all files from one directory to another directory:**

```bash
mv dir1/*  dir2
```
- All files of dir1 will be moved to dir2.
- After executing this command dir1 will become empty.

```bash
akshay@Ubuntu:~/Desktop$ touch a.txt b.txt c.txt  
akshay@Ubuntu:~/Desktop$ mkdir dir1  
akshay@Ubuntu:~/Desktop$ mkdir dir2  
akshay@Ubuntu:~/Desktop$ mv a.txt b.txt c.txt dir1  
akshay@Ubuntu:~/Desktop$ ls  
dir1  dir2  
akshay@Ubuntu:~/Desktop$ tree dir1  
dir1  
├── a.txt  
├── b.txt  
└── c.txt

0 directories, 3 files  
akshay@Ubuntu:~/Desktop$ ls  
dir1  dir2  
akshay@Ubuntu:~/Desktop$ mv dir1/* dir2  
akshay@Ubuntu:~/Desktop$ tree dir1  
dir1

0 directories, 0 files  
akshay@Ubuntu:~/Desktop$ tree dir2  
dir2  
├── a.txt  
├── b.txt  
└── c.txt

0 directories, 3 files  
```

**5. Moving total directory to another directory:**

```bash
mv dir1 dir2
```

**Note**: 
- If dir2 is already available then dir1 will be moved to dir2. 
- If dir1 is not already available then dir1 will be renamed to dir2.

```bash
akshay@Ubuntu:~/Desktop$ mv dir2 dir3  
akshay@Ubuntu:~/Desktop$ ls  
dir1  dir3  
akshay@Ubuntu:~/Desktop$ tree dir3  
dir3  
├── a.txt  
├── b.txt  
└── c.txt

0 directories, 3 files
```

```bash
akshay@Ubuntu:~/Desktop$ ls  
dir1  dir3  
akshay@Ubuntu:~/Desktop$ touch p.txt q.txt  
akshay@Ubuntu:~/Desktop$ mkdir src dir7 dir9  
akshay@Ubuntu:~/Desktop$ ls  
dir1  dir3  dir7  dir9  p.txt  q.txt  src  
akshay@Ubuntu:~/Desktop$ mv p.txt q.txt dir7 dir9 src  
akshay@Ubuntu:~/Desktop$ tree src  
src  
├── dir7  
├── dir9  
├── p.txt  
└── q.txt

2 directories, 2 files  
akshay@Ubuntu:~/Desktop$ ls  
dir1  dir3  src
```

**Summary of Directory related Commands:**

```bash
mkdir dir1 mkdir dir1 dir2 dir3 

mkdir dir1/dir2/dir3 

mkdir -p dir1/dir2/dir3 

mkdir dir{1..6}  

rmdir  dir1 rmdir  dir1 dir2 dir3 

rm -r  dir1 rm -ri  dir1 

rm -rf  dir1 rm -rv  dir1 

rm -r dir* 

rm -r dir{2..6}

rm -r dir[2,4] 

cp file1.txt  file2.txt 

cp file1.txt file2.txt file3.txt output 

cp dir1/* dir2 

cp -r dir1 dir2 

mv file1.txt file2.txt 

mv dir1 dir2 
#(rename b'z dir2 not available) 

mv  dir1/*  dir2 

mv  dir1 dir2 
#(move dir1 to dir2 because dir2 available) 

cd 

cd ../../.. 

cd / 

cd ~ 

cd -
```