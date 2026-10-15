# **System Information Commands**

Linux provides small commands for checking the operating system, machine, CPU, memory, storage, and uptime. These commands only display information.

| Command | Information shown |
|---|---|
| `uname -a` | Kernel and machine information |
| `cat /etc/os-release` | Linux distribution name and version |
| `hostname` | Machine's network name |
| `uptime` | How long the system has been running and current load averages |
| `lscpu` | CPU architecture, cores, and processor details |
| `free -h` | Memory and swap usage in readable units |
| `df -h` | Space used and available on mounted filesystems |
| `lsblk` | Block devices such as disks and partitions |

```bash
uname -a
cat /etc/os-release
hostname
uptime
lscpu
free -h
df -h
lsblk
```

`uname -a` describes the running kernel and machine; it does not give the distribution release. Use `/etc/os-release` for that. In `free` output, the `available` column is a more useful estimate of memory applications can use than `free` alone, because Linux uses spare memory for cache.

Options and available commands can differ across distributions. Read local documentation with `man uname`, `man free`, or `command --help`.

---

## **Summary**

- Use `uname -a` for kernel and machine details, and `/etc/os-release` for distribution details.
- Use `lscpu`, `free -h`, and `df -h` for CPU, memory, and filesystem space.
- Use `uptime`, `hostname`, and `lsblk` for runtime, machine name, and storage devices.

---

## **References**

- [Linux `uname(1)` manual](https://man7.org/linux/man-pages/man1/uname.1.html)
- [Linux `lscpu(1)` manual](https://man7.org/linux/man-pages/man1/lscpu.1.html)
- [Linux `free(1)` manual](https://man7.org/linux/man-pages/man1/free.1.html)
- [Linux `df(1)` manual](https://man7.org/linux/man-pages/man1/df.1.html)
