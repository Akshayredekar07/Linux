

## **Job Scheduling with Crontab**

### **Introduction to Cron**
- **Cron** is derived from the Greek word meaning **TIME**.  
- If any job executes automatically at specified time intervals, it is called a **cron job**.  
- A **cron job** can be either a single command or a script.  
- Cron jobs are configured in **crontab**.  
- They are best suited for automating workflows.  


### Various Important Commands
- **`crontab -l`**: List all configured cron jobs.  
- **`crontab -e`**: Edit existing cron jobs or define new ones.  
- **`crontab -r`**: Remove all configured cron jobs.  
- **`crontab filename`**: Install a new crontab from a file.  

---

### **Format of Crontab**
```plaintext
m    h    dom    mon    dow    command
```
- **m**: Minute (0-59).  
- **dom**: Date of Month (1-31).  
- **mon**: Month (1-12 or JAN, FEB, etc.).    
- **dow**: Day of Week (0-6 or SUN(0), MON(1), etc.).  
- **command**: The command or script to be executed.  

---

### Example: Write "Hello" to a File Every Minute
Command:
```bash
$ crontab -e
```
Crontab entry:
```plaintext
*  *  *  *  *  echo "Hello from cron" >> ~/Desktop/hello.txt
```

---

### Use Case: Backup Desktop Directory Every Friday at 23:59
**Script (`test.sh`)**:
```bash
tar -cjf backup$(date +%d_%m_%Y_%H_%M).tar ~/Desktop/* 
mv backup$(date +%d_%m_%Y_%H_%M).tar ~/backup
```
**Crontab Entry**:
```plaintext
59  23  *  *  FRI  bash ~/test.sh
```

---


### Real Example: **Automated Log Cleanup in Development Environments**

A system administrator can automate the cleanup of log files from a development server to save disk space and maintain system performance. The script removes log files older than 30 days from a specific directory and is scheduled using `crontab`.

### The Script: `cleanup_logs.sh`
```bash
#!/bin/bash

# Directory containing logs (modify as needed)
LOG_DIR="/var/log/myapp"

# Find and delete log files older than 30 days
find "$LOG_DIR" -type f -name "*.log" -mtime +30 -exec rm -f {} \;

# Log the cleanup activity
echo "$(date): Old logs removed from $LOG_DIR" >> ~/cleanup_log.txt
```

- **`/var/log/myapp`**: The directory where application logs are stored.
- **`-mtime +30`**: Selects files older than 30 days.
- **`-exec rm -f {} \;`**: Deletes the matching files.
- **`~/cleanup_log.txt`**: Logs the cleanup activity to a file in the administrator's home directory.


### Schedule the Script in Crontab
1. **Open Crontab**:
   ```bash
   crontab -e
   ```

2. **Add the Following Entry**:
   To run the script every day at 3:00 AM:
   ```plaintext
   0 3 * * * bash ~/cleanup_logs.sh
   ```

#### Explanation
- **`0 3 * * *`**: Schedule the job to run daily at 3:00 AM.
- **`bash ~/cleanup_logs.sh`**: Execute the log cleanup script.



### Workflow
1. The script runs daily at 3:00 AM.
2. It searches for `.log` files in `/var/log/myapp` that are older than 30 days.
3. Deletes the old logs to free up disk space.
4. Logs the action in `~/cleanup_log.txt` for future reference.

---

### Benefits in Development
- **Disk Space Management**: Automatically removes unnecessary log files.
- **System Performance**: Prevents the system from slowing down due to excessive logs.
- **Developer Productivity**: Frees developers from manual maintenance tasks.
- **Auditability**: Maintains a record of cleanup activities for troubleshooting and compliance.
