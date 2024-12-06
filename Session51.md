
## How to Run Our Script from Anywhere in Our System?

For any command or script, by default, the shell checks locations specified by the `PATH` variable. To run our script from anywhere, we need to add its location to the `PATH` variable. This can be done in two ways:

### 1 **Session Level**  
This method is temporary and works only for the current terminal session.

**Steps:**
1. Check the current `PATH` variable value:
   ```bash
   durgasoft@durgasoft:~/scripts$ echo $PATH
   /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
   ```

2. Add the script's location to the `PATH` variable:
   ```bash
   $ export PATH=$PATH:/home/durgasoft/scripts
   ```

3. Verify the updated `PATH` variable:
   ```bash
   durgasoft@durgasoft:~/scripts$ echo $PATH
   /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/durgasoft/scripts
   ```

Now, you can run your script without specifying its path:
```bash
$date.sh
The current System Date and Time:
Wed Dec 4 21:01:49 IST 2019
```

**Note**: These changes are temporary. They will be lost once the terminal session is closed.

---

### 2 **Setting PATH Permanently at User Level**
This method ensures the changes persist across terminal sessions.

**Steps:**
1. Open the `.bashrc` file located in your home directory:
   ```bash
   nano ~/.bashrc
   ```

2. Add the following line at the bottom of the file:
   ```bash
   export PATH=$PATH:/home/durgasoft/scripts
   ```

3. Save the file and exit. Apply the changes by running:
   ```bash
   source ~/.bashrc
   ```

Now, your script's location is permanently added to the `PATH` variable.

---

**Q5 What is the Meaning of a Startup File?**
- `.bashrc` is a startup file that is executed automatically when a new terminal session starts.  
- To perform specific tasks (e.g., creating aliases, updating the `PATH` variable), you can define them in this file.

---

**Q6 What is Meant by a Logout File?**
- `.bash_logout` is a logout file that is executed automatically when the terminal session exits.  
- To perform specific tasks (e.g., cleanup activities) during terminal exit, you can define them in this file.


The `.bashrc` file is typically located in the **home directory** of your user account. You can find it using the following methods:

### 1 **Default Path**  
The file is located at:

```bash
~/.bashrc
```
Here, `~` represents your home directory (e.g., `/home/username` on Linux systems).

### 2 **Check Existence**  
To confirm its presence, run:
```bash
ls -a ~ | grep .bashrc
```
This will list `.bashrc` if it exists.

### 3 **Edit or View**  
To edit the file:
```bash
nano ~/.bashrc
```

To view the file:
```bash
cat ~/.bashrc
```

### 4 **If `.bashrc` is Missing**  
If the `.bashrc` file is not present, you can create one:
```bash
touch ~/.bashrc
```
