#!/bin/bash

BACKUP_DIR="/home/$USER/backups/system_backup"
LOG_FILE="/home/$USER/backups/verification.log"

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log_message "Starting backup verification..."

if [ ! -d "$BACKUP_DIR" ]; then
 log_message "ERROR: Backup directory not found: $BACKUP_DIR"
 exit 1
fi

BACKUP_FILE_COUNT=$(find "$BACKUP_DIR" -type f | wc -l)
log_message "Files in backup: $BACKUP_FILE_COUNT"

BACKUP_SIZE=$(du -sh "$BACKUP_DIR" | cut -f1)
log_message "Backup size: $BACKUP_SIZE"

CRITICAL_FILES=(
 "important_data/document1.txt"
 "important_data/document2.txt"
 "important_data/config.conf"
)

for file in "${CRITICAL_FILES[@]}"; do
 if [ -f "$BACKUP_DIR/$file" ]; then
  log_message "VERIFIED: $file exists in backup"
 else
  log_message "WARNING: $file missing from backup"
 fi
done

BACKUP_AGE=$(find "$BACKUP_DIR" -type f -name "document1.txt" -mtime +1 | wc -l)

if [ "$BACKUP_AGE" -gt 0 ]; then
 log_message "WARNING: Backup appears to be older than 1 day"
else
 log_message "Backup is current"
fi

log_message "Backup verification completed"
