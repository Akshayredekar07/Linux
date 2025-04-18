#!/bin/bash

square(){

echo "the square of $n is $[n*n]"

}

read -p "Enter number to find square of number: " n

square $n

