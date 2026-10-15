#!/bin/bash

# Ensure the backup directory exists on the Desktop
mkdir -p ~/Desktop/backup

# Create a backup of the Desktop directory
tar --transform 's|^/||' -cjf backup$(date +%d_%m_%Y_%H_%M).tar ~/Desktop/*

# Move the backup archive to the backup directory on the Desktop
mv backup$(date +%d_%m_%Y_%H_%M).tar ~/Desktop/backup

