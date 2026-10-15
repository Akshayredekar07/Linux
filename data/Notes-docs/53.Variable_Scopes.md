**Variable Scopes**  

1. **Session Scope**  
   - Variables declared in the terminal are valid only during the session.  
   - They are removed when the session ends.  
   ```bash
   $ X=10  
   $ Y=20  
   ```  

2. **User Scope**  
   - Variables declared in the `.bashrc` file are available for all sessions of the current user.  
   - These variables are inaccessible to other users.  

Example `.bashrc` snippet:  
```bash
export GUEST=Dhoni  
export FRIEND=Sej
```  

3. **System Scope**  
   - Variables accessible to all users and sessions.  
   - Declared inside `/etc/profile`, requiring root permissions to edit.  

Example `/etc/profile` snippet:  
```bash
export NAME=DURGA  
export COURSE=PYTHON  
```  