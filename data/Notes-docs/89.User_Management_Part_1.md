
# Linux User and Group Management

1. How to add a new group?  
2. How to add a new user?  
3. How to switch from one user to another user?  
4. How to get information about a particular user?  
5. How to delete a user?  
6. How to delete a group?  
7. How to change the ownership of a file?  
8. How to change the group membership of a file?  
9. How to change the group of a user?  
10. How to add a user to multiple groups?  
11. How to check available groups?  
12. How to change the password of a user?  
13. What is the difference between `adduser` and `useradd` in Linux?  
14. What is the `sudo` command?  
15. What is the `sudoers` file?  
16. How to check the allowed commands by `sudo` for a particular user?  

### 1. Adding a New Group
To add a group, use the `addgroup` command with `sudo` permissions:
```bash
sudo addgroup <groupname>
```
Example:
```bash
sudo addgroup pythongroup
```
**Note:** All created groups can be viewed in the `/etc/group` file.

---

### 2. Adding a New User
To add a user, use the `adduser` command. Specify a group using `--ingroup` if needed:
```bash
sudo adduser --ingroup <groupname> <username>
```
Example:
```bash
sudo adduser --ingroup pythongroup pyuser1
```
If no group is specified, a new group with the same name as the username is created:
```bash
sudo adduser pyuser2
```
**Note:** User details are stored in the `/etc/passwd` file:
```bash
cat /etc/passwd
```

---

### 3. Switching Between Users
Use the `su` command to switch users:
```bash
su <username>
```
Example:
```bash
su pyuser1
```
To switch to the root user:
```bash
sudo -i
```

### `su` with and without `-` Option
- Without `-`: Switches user only (keeps the original environment).
- With `-`: Switches both user and environment.

---

### 4. Viewing User Information
To view a user's information, use the `id` command:
```bash
id <username>
```

---

### 5. Deleting a User
Use the `deluser` command:
```bash
sudo deluser <username>
```

---

### 6. Deleting a Group
Use the `delgroup` command:
```bash
sudo delgroup <groupname>
```

---

### 7. Changing Ownership of a File
Use the `chown` command:
```bash
sudo chown <username>:<groupname> <filename>
```

---

### 8. Changing Group Membership of a File
Use the `chgrp` command:
```bash
sudo chgrp <groupname> <filename>
```

---

### 9. Changing a User's Group
Modify the user's primary group:
```bash
sudo usermod -g <groupname> <username>
```

---

### 10. Adding a User to Multiple Groups
Use the `usermod` command with `-aG`:
```bash
sudo usermod -aG <group1>,<group2> <username>
```

---

### 11. Viewing Available Groups
To list all groups:
```bash
cat /etc/group
```

---

### 12. Changing a User's Password
Use the `passwd` command:
```bash
sudo passwd <username>
```

---

### 13. Difference Between `adduser` and `useradd`
- `adduser`: High-level command, interactive, and user-friendly.
- `useradd`: Low-level command, less interactive, requires manual steps.

---

### 14. `sudo` Command
`sudo` allows a permitted user to execute commands as another user (typically root).

---

### 15. `sudoers` File
The `/etc/sudoers` file defines permissions for users and groups to execute commands with `sudo`. Use `visudo` to safely edit it.

---

### 16. Checking Allowed Commands for a User
To see what commands a user can execute with `sudo`:
```bash
sudo -l -U <username>
```
