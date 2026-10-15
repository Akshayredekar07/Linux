#!/bin/bash

# Variables and Command Substitution
SOURCE_DIR="/home/akshay/Desktop/operations/session54"
BACKUP_DIR="/home/akshay/Desktop/operations/session54"
CURRENT_DATE=$(date '+%Y-%m-%d')
BACKUP_FOLDER="${BACKUP_DIR}/backup_${CURRENT_DATE}"
LOG_FILE="${BACKUP_FOLDER}/backup_log.txt"

# Create the backup folder
mkdir -p "${BACKUP_FOLDER}"

# Start the log file
echo "Backup Log - Date: ${CURRENT_DATE}" > "${LOG_FILE}"
echo "-----------------------------------" >> "${LOG_FILE}"

# Copy .txt files to the backup folder and log their names
cp "${SOURCE_DIR}"/*.txt "${BACKUP_FOLDER}" 2>/dev/null && ls "${BACKUP_FOLDER}"/*.txt >> "${LOG_FILE}"

# Count the number of files backed up
TOTAL_FILES=$(ls "${BACKUP_FOLDER}"/*.txt 2>/dev/null | wc -l)

# Display summary
echo "-----------------------------------"
echo "         Backup Summary            "
echo "-----------------------------------"
echo "Date of Backup        : ${CURRENT_DATE}"
echo "Source Directory      : ${SOURCE_DIR}"
echo "Backup Directory      : ${BACKUP_FOLDER}"
echo "Total Files Backed Up : ${TOTAL_FILES}"
echo "Log File              : ${LOG_FILE}"
echo "-----------------------------------"

# Handle case of no files to backup
if [ "${TOTAL_FILES}" -eq 0 ]; then
    echo "No '.txt' files found in the source directory. Backup skipped."
    rm -rf "${BACKUP_FOLDER}"
else
    echo "Backup completed successfully! Check the log file for details."
fi

