

## Project 1: Secret Agent Application

### Rules:
1. The first character of the **Name** should be `'d'`.
2. The last character of the **Favourite Actor** should be `'r'`.
3. The **Lucky Number** should be `7`.
4. The number of characters in the **Favourite Dish** should be `>= 6`.

If the above conditions are satisfied, the user is a valid secret agent and will receive information about the next operation. Otherwise, the application will send a "thanks" message.


## Version-1 (Performance-wise not up to the mark)

```bash
#! /bin/bash
echo "Welcome to Secret Agent Application"
echo "####################################"

read -p "Enter Your Name:" name
read -p "Enter Your Favourite Actor:" actor
read -p "Enter Your Lucky Number:" lucky
read -p "Enter Your Favourite Dish:" dish

first_char_name=$(echo -n $name | cut -c 1)
len=$(echo -n $actor | wc -c)
last_char_actor=$(echo -n $actor | cut -c $len)
no_of_characters_dish=$(echo -n $dish | wc -c)

if [ $first_char_name = "d" -a $last_char_actor = "r" -a $lucky -eq 7 -a $no_of_characters_dish -ge 6 ]; then
    echo "Hello Secret Agent...Our Next Operation is"
    echo "We have to kill at least 10 sleeping students of the classroom because they are a burden to the country"
else
    echo "Hello $name, thanks for your information"
fi
```


## Version-2 (Improved performance-wise)

```bash
#! /bin/bash
echo "Welcome to Secret Agent Application"
echo "####################################"

read -p "Enter Your Name:" name
first_char_name=$(echo -n $name | cut -c 1)
if [ $first_char_name != "d" ]; then
    echo "Hello $name, thanks for your information"
    exit 1
fi

read -p "Enter Your Favourite Actor:" actor
len=$(echo -n $actor | wc -c)
last_char_actor=$(echo -n $actor | cut -c $len)
if [ $last_char_actor != "r" ]; then
    echo "Hello $name, thanks for your information"
    exit 1
fi

read -p "Enter Your Lucky Number:" lucky
if [ $lucky -ne 7 ]; then
    echo "Hello $name, thanks for your information"
    exit 1
fi

read -p "Enter Your Favourite Dish:" dish
no_of_characters_dish=$(echo -n $dish | wc -c)
if [ $no_of_characters_dish -lt 6 ]; then
    echo "Hello $name, thanks for your information"
    exit 1
fi

echo "Hello Secret Agent...Our Next Operation is"
echo "We have to kill at least 10 sleeping students of the classroom because they are a burden to the country"
```

---

### Output:

```bash
durga@durga-VirtualBox:~/scripts$ test.sh
Welcome to Secret Agent Application
####################################
Enter Your Name:durga
Enter Your Favourite Actor:Ameer
Enter Your Lucky Number:7
Enter Your Favourite Dish:Fish
Hello durga, thanks for your information

durga@durga-VirtualBox:~/scripts$ test.sh
Welcome to Secret Agent Application
####################################
Enter Your Name:durga
Enter Your Favourite Actor:Ameer
Enter Your Lucky Number:7
Enter Your Favourite Dish:Mutton
Hello Secret Agent...Our Next Operation is
We have to kill at least 10 sleeping students of the classroom because they are a burden to the country
```
