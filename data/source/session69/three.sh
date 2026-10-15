#!/bin/bash

# Declare an array
declare -a fruits
fruits[10]="Apple"
fruits[20]="Banana"
fruits[30]="Orange"
fruits[40]="Mango"

# Print all elements before removal
echo "All Array Elements Before Removal: ${fruits[@]}"

# Remove elements using unset
unset fruits[20]
unset fruits[40]

# Print all elements after removal
echo "All Array Elements After Removal: ${fruits[@]}"

