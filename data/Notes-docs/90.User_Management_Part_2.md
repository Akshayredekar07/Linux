## Case Study: User and Group Management in Linux for Admins

### Objective:
To understand and apply essential Linux commands for user and group management, file ownership, and permissions to effectively administer a multi-user environment.

---

### Scenario:
Imagine you are the Linux administrator for a software company "TechWave Solutions" that uses Linux servers to manage projects. You need to ensure proper user access, secure file ownership, and organized group management for three teams working on:

1. **DataBridge** - A data analytics tool.
2. **CodeFusion** - A collaborative coding platform.
3. **SecureVault** - A secure document management system.

You need to:
- Assign users to the correct groups.
- Configure file permissions for project directories.
- Secure resources by assigning appropriate ownership.

---

### Tasks and Steps:

#### **1. Create User Accounts and Groups:**
Each project team will have its own group for better organization and security.

```bash
# Create groups for each project team
sudo groupadd databridge_team
sudo groupadd codefusion_team
sudo groupadd securevault_team

# Create user accounts and assign them to primary groups
sudo useradd -g databridge_team amit
sudo useradd -g codefusion_team priya
sudo useradd -g securevault_team raj
```

#### **2. Assign Users to Multiple Groups:**
Some users work on multiple projects and need access to other groups.

```bash
# Add users to secondary groups
sudo usermod -a -G codefusion_team amit
sudo usermod -a -G securevault_team priya
```

#### **3. Verify Group Membership:**
Check group membership for each user to ensure proper assignment.

```bash
# Check groups for each user
groups amit
groups priya
```

#### **4. Configure Project Directories:**
Set up directories for each project and assign group ownership.

```bash
# Create project directories
sudo mkdir /projects/databridge
sudo mkdir /projects/codefusion
sudo mkdir /projects/securevault

# Set group ownership
sudo chown :databridge_team /projects/databridge
sudo chown :codefusion_team /projects/codefusion
sudo chown :securevault_team /projects/securevault

# Set permissions for group collaboration
sudo chmod 770 /projects/databridge
sudo chmod 770 /projects/codefusion
sudo chmod 770 /projects/securevault
```

#### **5. Change Ownership of Files:**
Assign ownership of existing files to appropriate users or groups.

```bash
# Assign ownership of project files
sudo chown amit:databridge_team /projects/databridge/datafile.txt
sudo chown priya:codefusion_team /projects/codefusion/codefile.txt
```

#### **6. Secure Global Resources:**
Configure a global directory accessible to all users for shared resources.

```bash
# Create a shared directory
sudo mkdir /projects/shared

# Set permissions for global access
sudo chmod 777 /projects/shared
```

#### **7. Modify User Passwords:**
Ensure users have secure passwords.

```bash
# Set or change user passwords
sudo passwd amit
sudo passwd priya
```

---

### Notes and Best Practices:

1. **Least Privilege Principle:**
   Assign the minimum permissions required for users to perform their roles to enhance security.

2. **File Ownership and Permissions:**
   Use `chown` and `chmod` to manage ownership and permissions effectively.

3. **Audit and Monitoring:**
   Periodically verify user and group assignments using `groups` and `ls -l` commands.

4. **Access Control Lists (ACLs):**
   For more granular permissions, use ACLs (`setfacl` and `getfacl`).

5. **Documentation:**
   Maintain proper documentation for user roles, groups, and permission configurations.

---

### Outcome:
By following the steps above, the Linux administrator ensures:
- Proper segregation of users and teams.
- Secure access to project files and directories.
- Enhanced collaboration across project teams.

T


---

### Case Study: **Managing Users and Permissions in a Linux Environment**

#### Objective:
You are the system administrator for a development team working on a shared Linux server. The team consists of developers, testers, and a project manager. Your goal is to create and manage user accounts, groups, and file permissions to ensure a secure and efficient working environment.

---

### Scenario:

1. **Initial Setup**  
   The server needs to host the following groups:  
   - **dev_team**: For developers.  
   - **test_team**: For testers.  
   - **proj_mgmt**: For the project manager.

   Additionally, create the following directories:  
   - `/projects`: Shared by all users.  
   - `/dev_projects`: Accessible only to developers.  
   - `/test_reports`: Accessible only to testers.  
   - `/management`: Accessible only to the project manager.

---

### Tasks:

#### 1. Create Groups
Create the groups required for the team:
```bash
sudo groupadd dev_team
sudo groupadd test_team
sudo groupadd proj_mgmt
```

---

#### 2. Add Users to Groups
Add users to the system and assign them to their respective groups.  

**Developers**:
- `durga`
- `akshay`

**Testers**:
- `rohit`
- `sejal`

**Project Manager**:
- `radha`

Commands:
```bash
sudo adduser durga
sudo usermod -a -G dev_team durga

sudo adduser akshay
sudo usermod -a -G dev_team akshay

sudo adduser rohit
sudo usermod -a -G test_team rohit

sudo adduser sejal
sudo usermod -a -G test_team sejal

sudo adduser radha
sudo usermod -a -G proj_mgmt radha
```

---

#### 3. Set Directory Permissions
Set up directories and assign permissions based on group membership:

```bash
sudo mkdir /projects
sudo mkdir /dev_projects
sudo mkdir /test_reports
sudo mkdir /management

# Set ownership and permissions
sudo chown :dev_team /dev_projects
sudo chmod 770 /dev_projects

sudo chown :test_team /test_reports
sudo chmod 770 /test_reports

sudo chown :proj_mgmt /management
sudo chmod 770 /management

# Make /projects accessible to everyone
sudo chmod 777 /projects
```

---

#### 4. Verify User Access
Log in as different users and verify their access:

```bash
# Switch to durga and check access
su - durga
cd /dev_projects   # Should succeed
cd /test_reports   # Should fail
exit

# Switch to sejal and check access
su - sejal
cd /test_reports   # Should succeed
cd /dev_projects   # Should fail
exit
```

---

#### 5. Modify User Permissions
If a tester (e.g., `rohit`) is promoted to a developer role:
1. Remove `rohit` from `test_team`.
2. Add `rohit` to `dev_team`.

Commands:
```bash
sudo gpasswd -d rohit test_team
sudo usermod -a -G dev_team rohit
```

Verify the change:
```bash
groups rohit
```

---

#### 6. Password Management
Ensure all users have strong passwords and update passwords as needed:

- For user `akshay`:
  ```bash
  sudo passwd akshay
  ```

- For all users (force password change at next login):
  ```bash
  sudo passwd -e durga akshay rohit sejal radha
  ```

---

#### 7. Check System State
- List all users and groups:
  ```bash
  cat /etc/passwd
  cat /etc/group
  ```

- Check group memberships:
  ```bash
  groups durga
  groups sejal
  ```

---

### Outcomes:

1. **Secure Access**: Only authorized users can access specific directories.  
2. **Proper Group Management**: Teams are correctly grouped, simplifying permission assignments.  
3. **Efficient User Modifications**: Easily modify roles or permissions as team structures change.  
4. **Password Security**: Users follow strong password policies.  



### Case Study: **Managing a Multi-Project Environment for Software Development Teams**

#### Objective:
You are responsible for setting up and managing a Linux server for a software company that develops and maintains multiple software products. Each product has its own dedicated teams of developers, testers, and managers. Your task is to organize user accounts, groups, file permissions, and project-specific directories to ensure a secure and efficient working environment.

---

### Scenario:

The company manages the following software products:  
1. **FinTrack**: A personal finance management app.  
2. **EduConnect**: An online learning platform.  
3. **HealthSync**: A health and fitness tracking application.

Each product has:  
- **Developers**: Require full access to project code.  
- **Testers**: Require access to testing resources.  
- **Managers**: Require read-only access for monitoring.  

#### Directories to Set Up:
- `/projects/fintrack`  
- `/projects/educonnect`  
- `/projects/healthsync`  

---

### Tasks:

#### 1. Create Groups for Each Role
Create groups for developers, testers, and managers for each product:

```bash
sudo groupadd fintrack_devs
sudo groupadd fintrack_testers
sudo groupadd fintrack_managers

sudo groupadd educonnect_devs
sudo groupadd educonnect_testers
sudo groupadd educonnect_managers

sudo groupadd healthsync_devs
sudo groupadd healthsync_testers
sudo groupadd healthsync_managers
```

---

#### 2. Add Users to Groups
Assign users to appropriate groups based on their roles and products:

- **FinTrack**:
  - Developers: `vikas`, `anjali`
  - Testers: `kiran`, `priya`
  - Manager: `rahul`

```bash
sudo adduser vikas
sudo usermod -a -G fintrack_devs vikas

sudo adduser anjali
sudo usermod -a -G fintrack_devs anjali

sudo adduser kiran
sudo usermod -a -G fintrack_testers kiran

sudo adduser priya
sudo usermod -a -G fintrack_testers priya

sudo adduser rahul
sudo usermod -a -G fintrack_managers rahul
```

Repeat similar steps for users in **EduConnect** and **HealthSync**:
- **EduConnect**:
  - Developers: `rohit`, `sweta`
  - Testers: `amit`, `riya`
  - Manager: `neha`
  
- **HealthSync**:
  - Developers: `akash`, `tanvi`
  - Testers: `sheetal`, `deepak`
  - Manager: `meera`

---

#### 3. Create Directories for Each Product
Set up directories for each product:

```bash
sudo mkdir -p /projects/fintrack
sudo mkdir -p /projects/educonnect
sudo mkdir -p /projects/healthsync
```

---

#### 4. Set Ownership and Permissions for Directories
Assign ownership and permissions to ensure secure access:

- **FinTrack**:
  ```bash
  sudo chown :fintrack_devs /projects/fintrack
  sudo chmod 770 /projects/fintrack
  setfacl -m g:fintrack_testers:r-x /projects/fintrack
  setfacl -m g:fintrack_managers:r-- /projects/fintrack
  ```

- **EduConnect**:
  ```bash
  sudo chown :educonnect_devs /projects/educonnect
  sudo chmod 770 /projects/educonnect
  setfacl -m g:educonnect_testers:r-x /projects/educonnect
  setfacl -m g:educonnect_managers:r-- /projects/educonnect
  ```

- **HealthSync**:
  ```bash
  sudo chown :healthsync_devs /projects/healthsync
  sudo chmod 770 /projects/healthsync
  setfacl -m g:healthsync_testers:r-x /projects/healthsync
  setfacl -m g:healthsync_managers:r-- /projects/healthsync
  ```

---

#### 5. Verify Permissions
Log in as different users to ensure permissions are correctly configured:

- As a developer (`vikas`):
  ```bash
  su - vikas
  cd /projects/fintrack       # Should succeed
  touch test_file.txt         # Should succeed
  exit
  ```

- As a tester (`kiran`):
  ```bash
  su - kiran
  cd /projects/fintrack       # Should succeed
  ls                          # Should succeed
  touch test_file.txt         # Should fail
  exit
  ```

- As a manager (`rahul`):
  ```bash
  su - rahul
  cd /projects/fintrack       # Should succeed
  ls                          # Should succeed
  touch test_file.txt         # Should fail
  exit
  ```

---

#### 6. Add New Users Dynamically
If a new developer (`nisha`) is added to **HealthSync**:
```bash
sudo adduser nisha
sudo usermod -a -G healthsync_devs nisha
```

Verify:
```bash
groups nisha
```

---

#### 7. Secure Shared Resources
Create a shared directory `/projects/shared` for collaboration between all products:

```bash
sudo mkdir /projects/shared
sudo chmod 777 /projects/shared
```

This directory will allow all users to read, write, and execute.

---

#### 8. Audit and Monitor
Periodically check the permissions and group memberships to ensure security:

```bash
# List directory permissions
ls -ld /projects/*

# Check group memberships
groups vikas
groups kiran
groups rahul
```

---

### Outcomes:
1. **Secure Access Control**: Each user has access only to the directories and permissions relevant to their role and product.
2. **Collaboration Efficiency**: Shared resources are accessible to all without compromising product-specific security.
3. **Dynamic Management**: New users, roles, and products can be easily added or modified.
4. **Practical Use of Commands**: Utilized commands like `groupadd`, `usermod`, `chown`, `chmod`, and `setfacl`.

