```bash
# Create a new directory named session44
mkdir session44

# Navigate to session44 directory
cd session44

# Add a new group named coursegroup
sudo addgroup coursegroup

# Try to view the contents of a non-existent etc/group file (produces an error)
cat etc/group

# View the contents of the system group file
cat /etc/group

# Add a new user 'cuser1' and assign it to the coursegroup
sudo adduser --ingroup coursegroup cuser1

# View the contents of the system password file
cat /etc/passwd

# Add another user 'cuser2' and assign it to the coursegroup
sudo adduser --ingroup coursegroup cuser2

# Add a new group named empgroup
sudo addgroup empgroup

# Add a user 'empuser1' to the empgroup
sudo adduser --ingroup empgroup empuser1

# Display the username of the current user
whoami

# Switch to the user 'cuser1'
su - cuser1

# Display the username of the current user (now switched to cuser1)
whoami

# Print the current working directory
pwd

# Attempt to navigate to the Desktop directory (produces an error since it doesn't exist for cuser1)
cd Desktop

# Create a new file named demo.txt
touch demo.txt

# List the contents of the current directory in long format
ls -l

# Append text to demo.txt
cat >> demo.txt
```


#### **Switching to `cuser1` and Changing Permissions**
1. **Switch to `cuser1`:**
   ```bash
   su - cuser1
   ```
2. **Check the file permissions of `demo.txt`:**
   ```bash
   ls -l demo.txt
   ```
   Output (example):
   ```
   -rw-r--r-- 1 cuser1 coursegroup 0 Dec  2 15:04 demo.txt
   ```

3. **Change the file permission to allow only the owner to read and write (`rw-------`):**
   ```bash
   chmod g+r demo.txt
   ```

4. **Verify the changes:**
   ```bash
   ls -l demo.txt
   ```
   Output:
   ```
   -rw------- 1 cuser1 coursegroup 0 Dec  2 15:04 demo.txt
   ```

---

#### **Adding Group Permissions**
1. **Grant the group `coursegroup` write permissions for `demo.txt`:**
   ```bash
   chmod g+w demo.txt
   ```

2. **Verify the changes:**
   ```bash
   ls -l demo.txt
   ```
   Output:
   ```
   -rw-rw---- 1 cuser1 coursegroup 0 Dec  2 15:04 demo.txt
   ```

3. **Add execute permission to the group:**
   ```bash
   chmod g+x demo.txt
   ```

4. **Verify the new permissions:**
   ```bash
   ls -l demo.txt
   ```
   Output:
   ```
   -rw-rwx--- 1 cuser1 coursegroup 0 Dec  2 15:04 demo.txt
   ```

---

#### **Switch to Another User (`cuser2`)**
1. **Switch to `cuser2`:**
   ```bash
   su - cuser2
   ```

2. **Check access to `demo.txt` as `cuser2`:**
   ```bash
   ls -l /home/cuser1/demo.txt
   ```

3. **Attempt to edit the file:**
   ```bash
   nano /home/cuser1/demo.txt
   ```
   If `cuser2` does not have sufficient permissions, it will display a permission denied error.

---

#### **Changing Ownership and Group**
1. **Switch back to `akshay`:**
   ```bash
   su - akshay
   ```

2. **Change the owner of `demo.txt` to `empuser1`:**
   ```bash
   sudo chown empuser1 /home/cuser1/demo.txt
   ```

3. **Verify the ownership:**
   ```bash
   ls -l /home/cuser1/demo.txt
   ```
   Output:
   ```
   -rw-rwx--- 1 empuser1 coursegroup 0 Dec  2 15:04 demo.txt
   ```

4. **Change the group of `demo.txt` to `empgroup`:**
   ```bash
   sudo chgrp empgroup /home/cuser1/demo.txt
   ```

5. **Verify the new group:**
   ```bash
   ls -l /home/cuser1/demo.txt
   ```
   Output:
   ```
   -rw-rwx--- 1 empuser1 empgroup 0 Dec  2 15:04 demo.txt
   ```

---

#### **Assigning Special Permissions**
1. **Add the sticky bit to a directory (`session44`):**
   ```bash
   chmod +t /home/akshay/Desktop/operations/session44
   ```

2. **Set the `setgid` bit to inherit the group of `session44`:**
   ```bash
   chmod g+s /home/akshay/Desktop/operations/session44
   ```

3. **Verify the directory permissions:**
   ```bash
   ls -ld /home/akshay/Desktop/operations/session44
   ```
   Output:
   ```
   drwxrws--T 2 akshay empgroup 4096 Dec  2 15:04 session44
   ```

```bash
# Switching back to the original user
cuser1@myubuntu:~$ exit
logout
akshay@myubuntu:~/Desktop/operations/session44$

# Verifying ownership of the file
akshay@myubuntu:~/Desktop/operations/session44$ ls -l /home/cuser1/demo.txt
-rw-r--r-- 1 cuser1 coursegroup 0 Dec  2 15:04 demo.txt

# Changing ownership of the file to another user and group
akshay@myubuntu:~/Desktop/operations/session44$ sudo chown empuser1:empgroup /home/cuser1/demo.txt

# Verifying ownership change
akshay@myubuntu:~/Desktop/operations/session44$ ls -l /home/cuser1/demo.txt
-rw-r--r-- 1 empuser1 empgroup 0 Dec  2 15:04 demo.txt

# Switching to empuser1
akshay@myubuntu:~/Desktop/operations/session44$ su - empuser1
Password: 
empuser1@myubuntu:~$ whoami
empuser1

# Modifying the file as empuser1
empuser1@myubuntu:~$ echo "Added by empuser1!" >> /home/cuser1/demo.txt

# Verifying the changes
empuser1@myubuntu:~$ cat /home/cuser1/demo.txt
This line added by owner!
Added by empuser1!

# Changing permissions of the file
empuser1@myubuntu:~$ chmod 640 /home/cuser1/demo.txt

# Verifying updated permissions
empuser1@myubuntu:~$ ls -l /home/cuser1/demo.txt
-rw-r----- 1 empuser1 empgroup 42 Dec  2 15:04 /home/cuser1/demo.txt

# Attempting to modify the file as another user (cuser2) - Should fail
empuser1@myubuntu:~$ exit
logout
akshay@myubuntu:~/Desktop/operations/session44$ su - cuser2
Password: 
cuser2@myubuntu:~$ echo "Attempting to add by cuser2!" >> /home/cuser1/demo.txt
-bash: /home/cuser1/demo.txt: Permission denied

# Adding write permissions for the group
cuser2@myubuntu:~$ exit
logout
akshay@myubuntu:~/Desktop/operations/session44$ sudo chmod g+w /home/cuser1/demo.txt

# Verifying permissions
akshay@myubuntu:~/Desktop/operations/session44$ ls -l /home/cuser1/demo.txt
-rw-rw-r-- 1 empuser1 empgroup 42 Dec  2 15:04 /home/cuser1/demo.txt

# Modifying the file again as cuser2
akshay@myubuntu:~/Desktop/operations/session44$ su - cuser2
Password: 
cuser2@myubuntu:~$ echo "Added by cuser2!" >> /home/cuser1/demo.txt

# Verifying changes made by cuser2
cuser2@myubuntu:~$ cat /home/cuser1/demo.txt
This line added by owner!
Added by empuser1!
Added by cuser2!

# Removing group write permissions
cuser2@myubuntu:~$ exit
logout
akshay@myubuntu:~/Desktop/operations/session44$ sudo chmod g-w /home/cuser1/demo.txt

# Making the file executable for the owner
akshay@myubuntu:~/Desktop/operations/session44$ sudo chmod u+x /home/cuser1/demo.txt

# Verifying final permissions
akshay@myubuntu:~/Desktop/operations/session44$ ls -l /home/cuser1/demo.txt
-rwxr--r-- 1 empuser1 empgroup 42 Dec  2 15:04 /home/cuser1/demo.txt
```