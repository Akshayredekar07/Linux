#!/bin/bash

# Define the array with some initial and random elements
courses[0]=Java
courses[1]=Python
courses[2]=Linux
courses[3]=Django
courses[10]=DataScience
courses[20]=Devops

# Access elements
echo "First Element : ${courses[0]}"
echo "Second Element : ${courses[1]}"
echo "All Elements with @ : ${courses[@]}"
echo "All Elements with * : ${courses[*]}"
echo "The indices where elements are available : ${!courses[@]}"
echo "The total number of elements : ${#courses[@]}"
echo "The length of the first element : ${#courses[0]}"
