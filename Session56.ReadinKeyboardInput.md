
## How to Read Dynamic Data from the User

By using the `read` keyword, we can read dynamic data from the end user.

**Without Prompt Message:**
```bash
durgasoft@durgasoft:~/scripts$ read a b
100 200
durgasoft@durgasoft:~/scripts$ echo "The values of a and b are:$a and $b"
The values of a and b are:100 and 200
```

**With Prompt Message:**

**Approach-1:**
*test.sh*
```bash
#! /bin/bash
echo "Enter A Value:"
read A
echo "Enter B Value:"
read B
echo "A Value: $A"
echo "B Value: $B"
```

Execution:
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter A Value:
100
Enter B Value:
200
A Value: 100
B Value: 200
```

**Modified Version:**
*test.sh*
```bash
#! /bin/bash
echo -n "Enter A Value:"
read A
echo -n "Enter B Value:"
read B
echo "A Value: $A"
echo "B Value: $B"
```

Execution:
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter A Value:100
Enter B Value:200
A Value: 100
B Value: 200
```

**Approach-2:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter A Value:" A
read -p "Enter B Value:" B
echo "A Value: $A"
echo "B Value: $B"
```

Execution:
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter A Value:100
Enter B Value:200
A Value: 100
B Value: 200
```

**Reading User Credentials:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter User Name:" user
read -p "Enter Password:" password
echo "$user thanks for your information"
```

Execution:
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter User Name:durga
Enter Password:anushka123
durga thanks for your information
```

**Using `read -s` to Hide Input:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter User Name:" user
read -s -p "Enter Password:" password
echo
echo "Hello $user , thanks for your information"
```

Execution:
```bash
durgasoft@durgasoft:~/scripts$ test.sh
Enter User Name:Durga
Enter Password:
Hello Durga , thanks for your information
```

---

**Q2) Script to Read Student Data and Display to Console:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter Student Name:" name
read -p "Enter Student RollNo:" rollno
read -p "Enter Student Age:" age
read -p "Enter Student Marks:" marks
echo "Please confirm your details"
echo "------------------------------------------------"
echo "Student Name: $name"
echo "Student Rollno: $rollno"
echo "Student Age: $age"
echo "Student Marks: $marks"
```

---

**Q3) Script to Save Employee Details to `emp.txt`:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter Employee Number:" eno
read -p "Enter Employee Name:" ename
read -p "Enter Employee Salary:" esal
read -p "Enter Employee Address:" eaddr
echo "Below details are saved to the file"
echo "$eno:$ename:$esal:$eaddr"
echo "$eno:$ename:$esal:$eaddr" >> emp.txt
```

---

**Q4) Script to Find the Length of a String:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter any string to find length:" str
len=$(echo -n $str | wc -c)
echo "Length of $str : $len"
```

---

**Q5) Script to Display the Content of a File:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter any File name to display its content:" fname
echo "-----------------------------------------------"
cat $fname
echo "-----------------------------------------------"
```

---

**Q6) Script to Remove Blank Lines from a File:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter any File name to remove blank lines:" fname
grep -v "^$" $fname > temp.txt
mv temp.txt $fname
echo "In $fname all blank lines deleted"
```

---

**Q7) Script to Remove Duplicate Lines from a File:**
*test.sh*
```bash
#! /bin/bash
read -p "Enter any File name to remove duplicate lines:" fname
sort -u $fname > temp.txt
mv temp.txt $fname
echo "In $fname all duplicate lines deleted"
```
```