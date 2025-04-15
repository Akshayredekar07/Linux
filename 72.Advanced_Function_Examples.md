### Q10) Write a Function to Check whether the given Number is Even or Odd

```bash
#! /bin/bash
even_odd()
{
  n=$1
  if [ $((n % 2)) -eq 0 ]; then
    echo "$n is an Even Number"
  else
    echo "$n is an Odd Number"
  fi
}

read -p "Enter Any Number to test whether it is Even or Odd: " n
even_odd $n
```

---

### Q11) Write a Function to Test whether the given Number is Positive or Negative

```bash
#! /bin/bash
positive_negative()
{
  n=$1
  if [ $n -gt 0 ]; then
    echo "$n is a Positive Number"
  elif [ $n -lt 0 ]; then
    echo "$n is a Negative Number"
  else
    echo "It is just Zero"
  fi
}

read -p "Enter Any number to test whether it is positive or negative: " n
positive_negative $n
```
---

### Q12) Write a Function to Check whether the given Number is Prime or Not

```bash
#! /bin/bash
prime_check()
{
  n=$1
  if [ $n -le 1 ]; then
    echo "$n is not a PRIME number"
  else
    is_prime="yes"
    for ((i=2; i<n; i++))
    do
      if [ $((n % i)) -eq 0 ]; then
        echo "$n is not a PRIME Number"
        is_prime="no"
        break
      fi
    done
    if [ $is_prime = "yes" ]; then
      echo "$n is a PRIME Number"
    fi
  fi
}

read -p "Enter Any Number to test whether it is PRIME or not: " n
prime_check $n
```

---

### Q13) Write a Function to Generate Prime Numbers Less Than or Equal to Given Number

```bash
#! /bin/bash
prime_numbers_generator()
{
  n=$1
  for ((n1=2; n1<=n; n1++))
  do
    is_prime="yes"
    for ((i=2; i<n1; i++))
    do
      if [ $((n1 % i)) -eq 0 ]; then
        is_prime="no"
        break
      fi
    done
    if [ $is_prime = "yes" ]; then
      echo $n1
    fi
  done
}

read -p "Enter N value: " n
prime_numbers_generator $n
```

---

### Q14) Write a Function to Generate First `n` Prime Numbers

```bash
#! /bin/bash
prime_numbers_generator()
{
  n=$1
  count=0
  for ((n1=2; n1>=2; n1++))
  do
    is_prime="yes"
    for ((i=2; i<n1; i++))
    do
      if [ $((n1 % i)) -eq 0 ]; then
        is_prime="no"
        break
      fi
    done
    if [ $is_prime = "yes" ]; then
      echo $n1
      let count++
    fi
    if [ $count -eq $n ]; then
      break
    fi
  done
}

read -p "Enter n value: " n
prime_numbers_generator $n
```

