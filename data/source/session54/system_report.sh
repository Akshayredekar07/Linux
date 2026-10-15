#!/bin/bash

# Using Command Substitution to retrieve dynamic information
CURRENT_DATE=$(date '+%Y-%m-%d %H:%M:%S')
LOGGED_USER=$USER
WORKING_DIRECTORY=$(pwd)
TOTAL_FILES=$(ls | wc -l)
DISK_SPACE=$(df -h / | grep '/' | awk '{print $4}')

# Displaying the report using Variable Substitution
echo "-----------------------------------"
echo "       System Monitoring Report    "
echo "-----------------------------------"
echo "Date and Time          : $CURRENT_DATE"
echo "Logged-in User         : ${LOGGED_USER}"
echo "Current Working Directory : ${WORKING_DIRECTORY}"
echo "Total Number of Files  : ${TOTAL_FILES}"
echo "Available Disk Space   : ${DISK_SPACE}"
echo "-----------------------------------"

