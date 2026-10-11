
### **Calling Functions from Another Script**

**`util.sh`**
```bash
#! /bin/bash
x=888
y=999
add() {
    echo "$1 + $2 = $[$1 + $2]"
}
multiply() {
    echo "$1 * $2 = $[$1 * $2]"
}
subtract() {
    echo "$1 - $2 = $[$1 - $2]"
}
divide() {
    echo "$1 / $2 = $[$1 / $2]"
}
```

**`test.sh`**
```bash
#! /bin/bash
. ./util.sh  # Include `util.sh`
add 10 20
subtract 20 10
multiply 10 20
divide 20 10
echo "The value of x: $x"
echo "The value of y: $y"
```

**Output:**
```
10 + 20 = 30
20 - 10 = 10
10 * 20 = 200
20 / 10 = 2
The value of x: 888
The value of y: 999
```
