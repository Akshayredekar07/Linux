## more And Less commands

#### 6. `more` Command:  
- To view file content page by page:  

```bash
more file1.txt  
```

- Controls:  
    - `Enter`: next line  
    - `Space Bar`: next page  
    - `q`: quit  

```bash
more -d abc.txt 
#-d option to provide providing details
```

#### 7. `less` Command:  
- To view the content page by page, with both forward and backward navigation:  
```bash
less file1.txt  
```  
- Controls:  
    - `d`: next page  
    - `b`: previous page  

- Example
```bash
ls -l /dev | wc -l    
ls -l /dev | more    