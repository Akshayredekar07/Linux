## Linux vs Security

The virus files are usually created by others.  
Others are not given execute permission on our directories, thus they cannot add virus files.  
Hackers are also not granted execute permission on our directories, so they cannot read our file data.  
Due to these reasons, Linux is considered a more secure operating system.

### Linux Security Levels

Linux follows two levels of security:

1. **First Level**: Login with credentials  
2. **Second Level**: File and Directory permissions  

### Permission Types

Linux uses symbolic permissions: `r` (read), `w` (write), `x` (execute).  
Alternatively, permissions can be specified using octal numbers, called **numeric permissions**.

### Numeric Permissions

Numeric (Octal) permissions are represented by base-8 numbers (0-7).  
The mapping is as follows:

| Octal | Binary | Permission |
|-------|--------|------------|
| 0     | 000    | No Permission |
| 1     | 001    | Execute Permission |
| 2     | 010    | Write Permission |
| 3     | 011    | Write and Execute Permissions |
| 4     | 100    | Read Permission |
| 5     | 101    | Read and Execute Permissions |
| 6     | 110    | Read and Write Permission |
| 7     | 111    | Read, Write, and Execute Permissions |

### Breaking it Down:
- **4**: Read Permission
- **2**: Write Permission
- **1**: Execute Permission

It’s easier to remember:
- **5** = 4+1 → `r-x`  
- **3** = 2+1 → `-wx`  
- **6** = 4+2 → `rw-`  

### Example Command

For the following permissions:
- **User**: Read and Write (6)
- **Group**: Write and Execute (3)
- **Others**: Write (2)

### Execution of commands:

1. **Initial State:**
   ```bash
   ls -l demo.txt
   # -rw-rw-rw-  (Owner, Group, Others have read & write)
   ```

2. **Changed Permissions to `777` (Full permissions for everyone):**
   ```bash
   chmod 777 demo.txt
   ls -l demo.txt
   # -rwxrwxrwx  (Owner, Group, Others have read, write, execute)
   ```

3. **Changed Permissions to `77` (Owner has no permissions, Group and Others have full permissions):**
   ```bash
   chmod 77 demo.txt
   ls -l demo.txt
   # ----rwxrwx  (Owner has no permissions, Group/Others have rwx)
   ```

4. **Changed Permissions to `7` (Only Others have full permissions):**
   ```bash
   chmod 7 demo.txt
   ls -l demo.txt
   # -------rwx  (Owner/Group have no permissions, Others have rwx)
   ```

5. **Error when Running `chmod demo.txt`:**
   ```bash
   chmod demo.txt
   # Error: Missing operand (permission mode).
   ```

### Explanation:
- **`chmod 777`**: Gives **full permissions** (read, write, execute) to **owner**, **group**, and **others**.
- **`chmod 77`**: **Owner** has no permissions, **group** and **others** have full permissions (rwx).
- **`chmod 7`**: **Only others** have full permissions (rwx), **owner** and **group** have no permissions.
- **Error**: `chmod` requires both the **permission mode** and the **file name** to work properly. You didn't specify a mode, which caused the error.

### Correct Command Syntax:
```bash
chmod <permissions> <filename>
```