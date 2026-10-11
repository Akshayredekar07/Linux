### **Key Concepts:**

#### 1. **`umask` Command**:
   - **Definition**: `umask` stands for "user mask" and determines the default permissions for newly created files and directories by masking out certain permissions.
   - **Default `umask` value**: 022 (commonly).
     - **First digit**: Sticky bit (rarely used in daily operations).
     - **Last three digits**: Relevant for file and directory permissions.
   
#### **Default Permissions**:
- **Files**: 666 (rw-rw-rw- by default).
- **Directories**: 777 (rwxrwxrwx by default).

### **Umask Calculation**:
   - Default permissions are subtracted by the umask value to get the actual permissions.
   
   - **File Example:**
     ```bash
     Default file permissions: 666
     Umask value: 022
     Actual permissions: 666 - 022 = 644 (rw-r--r--)
     ```
     When a file is created, its permissions will be `rw-r--r--`.

   - **Directory Example:**
     ```bash
     Default directory permissions: 777
     Umask value: 022
     Actual permissions: 777 - 022 = 755 (rwxr-xr-x)
     ```
     When a directory is created, its permissions will be `rwxr-xr-x`.

#### 2. **Changing `umask`**:
   You can modify the `umask` value to control the default permissions for new files and directories.
   - **Example**:
     ```bash
     umask 002  # Sets umask to 002
     touch file2.txt  # Creates a file with rw-rw-r-- permissions
     mkdir dir2  # Creates a directory with rwxrwxr-x permissions
     ```
   - **Example for `umask 077`**:
     ```bash
     umask 077
     touch file3.txt  # Creates a file with rw------- permissions
     ```

   **Question:** If you want newly created files to have **444** permissions (read-only for everyone), the umask value should be **222**.

#### 3. **`chown` and `chgrp` Commands**:
   - **`chown`**: Changes the **owner** of a file or directory.
     ```bash
     sudo chown root demo.txt  # Changes the owner of demo.txt to root
     ```
   - **`chgrp`**: Changes the **group** of a file or directory.
     ```bash
     sudo chgrp root demo.txt  # Changes the group of demo.txt to root
     ```

#### **Example Using `chown` and `chgrp`**:
   - **Before `chown`**:
     ```bash
     -rw-r--r-- 1 durgasoft durgasoft 0 Nov 29 21:33 demo.txt
     ```
   - **After `chown root`**:
     ```bash
     -rw-r--r-- 1 root durgasoft 0 Nov 29 21:33 demo.txt
     ```

   **Explanation**:
   - The owner of the file changes from `durgasoft` to `root`, but the group remains the same.

#### 4. **File Permissions**:
   - Permissions are shown in `rwx` format:
     - `r`: Read
     - `w`: Write
     - `x`: Execute
   - **Owner**: The user who owns the file.
   - **Group**: Users who are in the same group as the file.
   - **Others**: All other users.

   **Example Permissions**:
   - `-rwxrw-r--`:
     - Owner: read, write, execute
     - Group: read, write
     - Others: read only

#### **Permission Scenarios**:
   - **Group Permissions**:
     ```bash
     -rwxr--r-- 1 root durgasoft 46 Nov 30 20:11 demo.txt
     ```
     Group members (`durgasoft`) can **only read** the file.

   - **Others Permissions**:
     ```bash
     -rwxrwxr-- 1 root root 114 Nov 30 20:22 demo.txt
     ```
     Others have **read** permission only.

   - **Access Denied**:  
     When a user tries to write to a file without write permissions:
     ```bash
     bash: demo.txt: Permission denied
     ```

---

### **Commands Summary:**

- **`umask`**: Displays or sets the user mask, determining default file and directory permissions.
- **`chown`**: Changes the owner of a file.
- **`chgrp`**: Changes the group of a file.
  
### **Important Notes:**
- **Negative `umask` values** are not valid in Linux.
- **Common `umask` values**:
  - `022`: Default, allows read/write for the owner and read-only for group/others.
  - `002`: Allows write permissions for the group.
  - `077`: Restricts file permissions to only the owner.

---

This covers key concepts about file permissions, `umask`, `chown`, and `chgrp`. Let me know if you need further clarification!