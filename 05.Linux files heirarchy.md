
# Linux Directory Structure

## /tmp Directory
> "tmp" stands for "temporary."

- The `/tmp` directory contains temporary files created during the current session.
- It is used for files needed only temporarily and is automatically cleared upon system shutdown.
- **Note**: Not recommended for storing permanent files.

### Example Commands
1. **Creating and Editing a Temporary File**
   ```bash
   gedit demo.txt
   ```
   - Open `demo.txt` and add content.

2. **Viewing Content in `demo.txt`**
   ```bash
   cat demo.txt
   ```
   - Displays the content of `demo.txt`:
     ```
     add some content here
     add more extra content here
     ```

3. **Checking File Permissions**
   ```bash
   ls -l demo.txt
   ```
   - Example Output:
     ```
     -rw-rw-r-- 1 akshay akshay 49 Sep 4 16:20 demo.txt
     ```

4. **Modifying File Permissions**
   ```bash
   chmod u-rw demo.txt
   ```
   - Removes read and write permissions for the user, resulting in permission denial when trying to read:
     ```bash
     cat demo.txt
     # Output: cat: demo.txt: Permission denied
     ```

5. **Restoring Permissions**
   ```bash
   chmod u+rw demo.txt
   ```
   - Grants read and write permissions back to the user.
   
6. **Appending Content**
   ```bash
   cat >> demo.txt
   added last line by akshay
   ```
   - Use `Ctrl + D` to save and exit.

---

## /dev Directory
> "dev" stands for "device."

- In Linux, all devices are represented as files.
- The `/dev` directory contains special files used to interact with devices.

### Common Files
- **tty**: Terminal-related file.
- **fd**: Floppy drive-related file.
- **hd**: Hard disk-related file.
- **ram**: RAM-related file.
- **stdin**: Standard input (keyboard).
- **stdout**: Standard output (terminal/monitor).
- **stderr**: Standard error output (terminal/monitor).

---

## /mnt Directory
> "mnt" stands for "mount."

- The `/mnt` directory is used for attaching external file systems to the Linux file system (e.g., pen drives, CDs, external hard disks).
- **Mounting**: Process of attaching external file systems. Older OS versions required manual mounting; recent OS versions do this automatically.

---

## /media Directory
- This directory is used for **automatically mounted devices** (e.g., USB drives, external hard drives, CD/DVD drives).
- **Difference from `/mnt`**:
  - `/mnt`: Contains manually mounted files.
  - `/media`: Contains automatically mounted files.

---

## /opt Directory
> "opt" stands for "optional."

- Contains installation files for third-party software not included in the default system installation.
- Examples:
  - Google Chrome
  - Oracle products
  - Other manually installed applications

---

## /lib Directory
- The `/lib` directory stores essential shared libraries and kernel modules required by the Linux OS, commands, and applications.

---

## /var Directory
> "var" stands for "variable data."

- Stores data that frequently changes, like system logs, mail spools, and print spools.
- **Example**: Log files are commonly stored here.

---

## /home Directory
- Each user has a unique directory within `/home` to store personal files.
- Example: `/home/durgasoft` contains folders like `Desktop`, `Downloads`, `Movies`, `Pictures`.

---

## /proc Directory
> "proc" stands for "processes."

- Contains information about all running processes.
- Each process has a directory named after its Process ID (PID) to store specific process data.
- **Note**: Use `ps` command to view running processes.
  
  ### Example Command
  ```bash
  ps -ef
  ```
  - Displays all processes in full format.

---

## /root Directory
> The home directory for the **superuser**.

- Located at `/root` in the filesystem.
- Not to be confused with `/` (root directory for the entire filesystem).
  
  ### Note
  - `/home/durgasoft` - User Home Directory for `durgasoft`
  - `/root` - Super User Home Directory

### Difference Between `/` and `/root`
- `/` is the topmost directory in the Linux file system.
- `/root` is a subdirectory of `/`, serving as the home directory for the superuser.

---

## /boot Directory
- Contains files required to boot the Linux operating system, such as the kernel, initial RAM disk, and bootloader configuration.

---

## /usr Directory
> "usr" stands for "user."

- Contains user-related software and applications.
- **Subdirectories**:
  - `/usr/bin`: User commands.
  - `/usr/sbin`: System administration commands.
  - `/usr/lib`: Libraries.
  - `/usr/share`: Architecture-independent data.
- **Note**: Historically, "usr" stood for "Unix System Resources," though it is now commonly interpreted as "user."

---

## Additional Notes on Linux File System
- **Main Advantage**: The Linux file system structure allows the OS to easily locate files.
- **File System Naming**:
  - **Linux Examples**: ext2, ext3, ext4, XFS
  - **Windows Examples**: NTFS, FAT
