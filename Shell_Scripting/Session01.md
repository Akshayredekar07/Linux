```plaintext
┌───────────┐
│   User    │
│(Commands) │
└───────────┘
      │
      v
┌───────────┐
│   Shell   │
│ (bash, sh,│
│  csh, zsh)│
└───────────┘
      │
      v
┌───────────┐
│  Kernel   │
│ (System   │
│  Calls &  │
│  Hardware)│
└───────────┘
      │
      v
┌───────────┐
│ Hardware  │
│ (CPU,     │
│ Memory,   │
│ I/O)      │
└───────────┘
```

```bash
akshay@myubuntu:~/Documents/Linux$ cd Shell\ Scripting/
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test2.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ls -l test.sh 
-rw-rw-r-- 1 akshay akshay 45 Nov 20 19:27 test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ chmod u+x test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ls -l test.sh 
-rwxrw-r-- 1 akshay akshay 45 Nov 20 19:27 test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ./test.sh 
welcome to shell scripting
Wed Nov 20 07:32:21 PM IST 2024
/home/akshay/Documents/Linux/Shell Scripting
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ls -l test2.sh 
-rw-rw-r-- 1 akshay akshay 44 Nov 20 19:28 test2.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ chmod u+x test2.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ ./test2.sh 
Wed Nov 20 07:32:45 PM IST 2024
Wed Nov 20 07:32:45 PM IST 2024
Welcome to shell scripting
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ cal
   November 2024      
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ gedit test.sh
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ sh ./test.sh 
welcome to shell scripting
Wed Nov 20 07:34:17 PM IST 2024
/home/akshay/Documents/Linux/Shell Scripting
   November 2024      
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ bash ./test.sh 
welcome to shell scripting
Wed Nov 20 07:37:35 PM IST 2024
/home/akshay/Documents/Linux/Shell Scripting
   November 2024      
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
                      
akshay@myubuntu:~/Documents/Linux/Shell Scripting$ bash ./test2.sh 
Wed Nov 20 07:37:41 PM IST 2024
Wed Nov 20 07:37:41 PM IST 2024
Welcome to shell scripting
```