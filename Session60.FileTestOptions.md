
# File Test Options

- **`-e`** → Returns true if file/directory exists  
- **`-s`** → Returns true if the file is non-empty  
- **`-f`** → Returns true if the file is a regular file  
- **`-d`** → Returns true if the file is a directory  
- **`-l`** → Returns true if the file is a link file  
- **`-b`** → Returns true if the file is a block special file  
- **`-c`** → Returns true if the file is a character special file  


### **File Permission Tests**
- **`-r`** → Returns true if the current user has read permission on the file  
- **`-w`** → Returns true if the current user has write permission on the file  
- **`-x`** → Returns true if the current user has execute permission on the file  
- **`-o`** → Returns true if the current user is the owner of the file  


### **File Comparison Tests**
- **`file1 -ot file2`** → Returns true if `file1` is older than `file2` (last modified time)  
- **`file1 -nt file2`** → Returns true if `file1` is newer than `file2` (last modified time)  


## Example Scripts

### **1. Script to Test whether the given File Exists or Not**
```bash
#!/bin/bash
read -p "Enter File Name to test:" fname
if [ -e $fname ]; then
    echo "$fname exists"
else
    echo "$fname does not exist"
fi
```

### **2. Script to Test if the File is a Regular File or Directory**
```bash
#!/bin/bash
read -p "Enter File Name to test:" fname
if [ -e $fname ]; then
    if [ -f $fname ]; then
        echo "It is a regular file"
    elif [ -d $fname ]; then
        echo "It is a directory"
    else
        echo "It is a special file"
    fi
else
    echo "$fname does not exist"
fi
```

**Output Example:**
```plaintext
Enter File Name to test:a.txt
It is a regular file

Enter File Name to test:dir1
It is a directory
```


### **3. Script to Display File Content**
```bash
#!/bin/bash
read -p "Enter File Name to test:" fname
if [ -e $fname ]; then
    if [ -f $fname ]; then
        if [ -r $fname ]; then
            cat $fname
        else
            echo "User does not have read permission"
        fi
    else
        echo "It is not a regular file"
    fi
else
    echo "$fname does not exist"
fi
```

---

### **4. Script to Check if a File is Empty**
```bash
#!/bin/bash
read -p "Enter File Name to test:" fname
if [ -e $fname ]; then
    if [ -f $fname ]; then
        if [ -s $fname ]; then
            echo "$fname is not an empty file"
        else
            echo "$fname is an empty file"
        fi
    else
        echo "It is not a regular file"
    fi
else
    echo "$fname does not exist"
fi
```


### **5. Script to Compare Content of Two Files**
```bash
#!/bin/bash
read -p "Enter First File Name: " fname1
read -p "Enter Second File Name: " fname2
result=$(cmp $fname1 $fname2)
if [ -z "$result" ]; then
    echo "The given files have the same content"
else
    echo "The given files have different content"
fi
```


### **6. Script to Display File Permissions**
```bash
#!/bin/bash
read -p "Enter File Name: " fname
READ=NO
WRITE=NO
EXECUTE=NO

if [ -r $fname ]; then READ=YES; fi
if [ -w $fname ]; then WRITE=YES; fi
if [ -x $fname ]; then EXECUTE=YES; fi

echo "User Permissions Summary"
echo "-------------------------"
echo "Read Permission: $READ"
echo "Write Permission: $WRITE"
echo "Execute Permission: $EXECUTE"
```

**Output Example:**
```plaintext
Enter File Name: a.txt
User Permissions Summary
-------------------------
Read Permission: YES
Write Permission: YES
Execute Permission: NO
```


### **7. Script to Remove a File or Directory**
```bash
#!/bin/bash
read -p "Enter file/directory name to delete:" fname
if [ -e $fname ]; then
    rm -r $fname
    echo "$fname removed successfully"
else
    echo "$fname does not exist"
fi
```


### **Mini Application: Copy and Compress Directories**
```bash
#!/bin/bash
# Check command-line arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

source=$1
destination=$2
timestamp=$(date '+%Y%m%d_%H%M%S')
error_file="error_$timestamp.log"

# Perform validations
if [ ! -d "$source" ]; then
    echo "Source directory does not exist" >> $error_file
    exit 1
fi

if [ ! -d "$destination" ]; then
    echo "Destination directory does not exist" >> $error_file
    exit 1
fi

if [ ! -r "$source" ] || [ ! -x "$source" ]; then
    echo "Source directory does not have read and execute permissions" >> $error_file
    exit 1
fi

if [ ! -w "$destination" ] || [ ! -x "$destination" ]; then
    echo "Destination directory does not have write and execute permissions" >> $error_file
    exit 1
fi

# Copy and compress
tar_file="backup_$timestamp.tar.gz"
echo "Creating tar file..."
tar -czf $tar_file -C $source .
mv $tar_file $destination

# Extract files
cd $destination
echo "Extracting files..."
tar -xzf $tar_file
rm $tar_file
echo "Process completed successfully."
```
