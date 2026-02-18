#!/bin/bash
# System Backup Script using rsync

BACKUP_SOURCE="/home/$USER"
BACKUP_DEST="/home/$USER/backups/system_backup"
LOG_FILE="/home/$USER/backups/backup.log"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p "$BACKUP_DEST"
mkdir -p "$(dirname "$LOG_FILE")"

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Starting system backup..."

rsync -av \
 --delete \
 --exclude='*.tmp' \
 --exclude='*.cache' \
 --exclude='.Trash*' \
 --exclude='Downloads/' \
 --stats \
 "$BACKUP_SOURCE/" \
 "$BACKUP_DEST/" 2>&1 | tee -a "$LOG_FILE"

if [ ${PIPESTATUS[0]} -eq 0 ]; then
 log_message "Backup completed successfully"

 BACKUP_SIZE=$(du -sh "$BACKUP_DEST" | cut -f1)
 log_message "Backup size: $BACKUP_SIZE"

 find "$BACKUP_DEST" -type f > "$BACKUP_DEST/../backup_manifest_$DATE.txt"
 log_message "Backup manifest created: backup_manifest_$DATE.txt"
else
 log_message "Backup failed with errors"
 exit 1
fi

log_message "Backup process completed"
