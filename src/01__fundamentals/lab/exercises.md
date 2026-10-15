# **Exercises: Fundamentals**

Practice the ideas from each fundamentals lesson. Run the commands in a Linux terminal. Answers follow each exercise.

## **1. Introduction**

1. In your own words, distinguish the Linux **kernel** from a Linux **distribution**.
2. Name one way Linux is used outside desktop computers.

**Answers:** 1. The kernel manages hardware and system resources; a distribution packages the kernel with tools, applications, and defaults. 2. Examples include servers, phones, embedded devices, and supercomputers.

## **2. Linux Distributions**

Run `cat /etc/os-release` and `uname -r`.

1. Which output identifies your distribution and release?
2. What does `uname -r` identify?

**Answers:** 1. `/etc/os-release`. 2. The running kernel release, not the distribution release.

## **3. Components of Linux**

Run `echo "$SHELL"`, `type cd`, `type ls`, and `echo "$PATH"`.

1. Which is a shell builtin: `cd` or `ls`?
2. What does `PATH` help the shell find?

**Answers:** 1. `cd` is normally a builtin; `ls` is an external program. 2. Directories in which the shell searches for executable commands.

## **4. Everything Is a File**

Run `ls -l /dev/null /dev/zero`, `cat /proc/uptime`, and `echo hello > /dev/null`.

1. What happens to text sent to `/dev/null`?
2. Is `/proc/uptime` ordinary data stored on disk?

**Answers:** 1. It is discarded. 2. No. `/proc` exposes virtual process and kernel information.

## **5. Linux File Types**

Run `ls -l /etc/passwd /dev/null /bin/sh` and `file /etc/passwd /bin/sh`.

1. What does the first character in `ls -l` show?
2. What does a symbolic link do if its target is removed?

**Answers:** 1. The entry type (for example, `-` regular file, `d` directory, `l` link, `c` character device). 2. It becomes a broken link; deleting the link itself does not delete its target.

## **6. Linux File Hierarchy**

Run `pwd`, `ls /`, `cat /etc/hostname`, and `df -h /`.

1. Where are system-wide configuration files usually stored?
2. What does `df -h /` report?

**Answers:** 1. `/etc`. 2. Space used and available on the filesystem containing `/`, in readable units.

## **7. Hidden Files and Directories**

In a temporary practice directory, run `touch visible .hidden`, then `ls`, `ls -a`, and `ls -A`.

1. What makes `.hidden` hidden?
2. How do `ls -a` and `ls -A` differ?
3. What do `.` and `..` mean in a path?

**Answers:** 1. Its name starts with a dot. 2. Both include hidden names; `-a` also shows `.` and `..`, while `-A` omits them. 3. Current directory and parent directory.

## **8. Command Syntax and Help (`ls`)**

Run `ls -la`, `ls -ltr`, `ls -lh`, and `man ls` (press `q` to quit).

1. Which option includes hidden entries?
2. Which combination sorts oldest modification time first?
3. What does `-r` do by itself?

**Answers:** 1. `-a` (or `-A`, which omits `.` and `..`). 2. `-tr`; `-ltr` also requests long format. 3. Reverses the active sort; alone it reverses the default name order.

## **9. System Information Commands**

Run `hostname`, `uptime`, `lscpu`, `free -h`, `df -h /`, and `lsblk`.

1. Which command shows CPU details?
2. Which command shows memory and swap usage?
3. Which command lists disks and partitions?

**Answers:** 1. `lscpu`. 2. `free -h`. 3. `lsblk`.
