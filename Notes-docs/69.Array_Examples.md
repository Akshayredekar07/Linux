
## Bash Scripting Examples for Arrays

### Q1 Write a Script to Create an Array with Some Elements and Print All Elements Using While Loop, For Loop, and Advanced For Loop?

```bash
#!/bin/bash
declare -a fruits
fruits=("Apple" "Orange" "Banana" "Mango")
size=${#fruits[@]}
i=0

echo "All elements by using while loop:"
while [ $i -lt $size ]
do
  echo ${fruits[$i]}
  let i++
done

echo "All elements by using for loop:"
for fruit in ${fruits[@]}
do
  echo $fruit
done

echo "All elements by using advanced for loop:"
for (( i=0; i < ${#fruits[@]}; i++ ))
do
  echo ${fruits[$i]}
done
```

### Note:
1. If we create an array with elements directly:
   ```bash
   fruits=("Apple" "Orange" "Banana" "Mango")
   ```
   Then the indices will be 0, 1, 2, 3, etc.
2. After creating an array, we can add extra elements:
   ```bash
   fruits=("Apple" "Orange" "Banana" "Mango")
   fruits[4]="Sapota"
   ```


### Q2 Write a Script for Accessing Array Elements Using For Loop If Indices Are Random?

```bash
#!/bin/bash
declare -a fruits
fruits[10]="Apple"
fruits[20]="Banana"
fruits[30]="Orange"
fruits[40]="Mango"

echo "Accessing based on Values:"
for fruit in ${fruits[@]}
do
  echo $fruit
done

echo
echo "Accessing based on Index:"
for index in ${!fruits[@]}
do
  echo ${fruits[$index]}
done
```


### Q3 Is It Possible to Remove Array Elements?

Yes, it's possible using the `unset` command.

```bash
#!/bin/bash
declare -a fruits
fruits[10]="Apple"
fruits[20]="Banana"
fruits[30]="Orange"
fruits[40]="Mango"

echo "All Array Elements Before Removal: ${fruits[@]}"
unset fruits[20]
unset fruits[40]
echo "All Array Elements After Removal: ${fruits[@]}"
```


### Q4 Write a Script to Store Given `n` Numbers Into an Array?

```bash
#!/bin/bash
read -p "Enter The Number Of values:" n
for ((i=0,j=1;i<n;i++))
do
  read -p "Enter The Number-$[j++]:" NUM[${i}]
done
```


### Q5 Write a Script to Read `n` Numbers and Store Inside an Array. Print the Sum of Even Numbers and Odd Numbers Separately?

```bash
#!/bin/bash
read -p "Enter Number of Values:" n
for((i=0,j=1;i<n;i++))
do
  read -p "Enter The Number-$[j++]:" NUM[$i]
done

esum=0
osum=0
for val in ${NUM[@]}
do
  if [ $[val%2] -eq 0 ]; then
    let esum=esum+val
  else
    let osum=osum+val
  fi
done

echo "The Sum of Even Numbers: $esum"
echo "The Sum of Odd Numbers: $osum"
```

### Q6 Write a Script to Store All `.txt` File Names Present in Current Working Directory into an Array and Print Permissions of Every File?

```bash
#!/bin/bash
files=($(ls *.txt))
for fname in ${files[@]}
do
  echo -ne "$fname:\t"
  if [ -r $fname ]; then
    echo -ne "READ(Y)\t"
  else
    echo -ne "READ(N)\t"
  fi
  if [ -w $fname ]; then
    echo -ne "WRITE(Y)\t"
  else
    echo -ne "WRITE(N)\t"
  fi
  if [ -x $fname ]; then
    echo "EXECUTE(Y)"
  else
    echo "EXECUTE(N)"
  fi
done
```