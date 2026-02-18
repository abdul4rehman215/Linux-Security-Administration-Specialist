#!/bin/bash
# Weekly Full System Backup Script

BACKUP_SOURCE="/home/$USER"
BACKUP_DEST="/home/$USER/backups/weekly_backup_$(date +%Y%m%d)"
LOG_FILE="/home/$USER/backups/weekly_backup.log"

mkdir -p "$BACKUP_DEST"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Starting weekly backup..." >> "$LOG_FILE"

rsync -av \
 --delete \
 --exclude='*.tmp' \
 --exclude='*.cache' \
 --exclude='.Trash*' \
 --stats \
 "$BACKUP_SOURCE/" \
 "$BACKUP_DEST/" >> "$LOG_FILE" 2>&1

tar -czf "$BACKUP_DEST.tar.gz" -C "$(dirname "$BACKUP_DEST")" "$(basename "$BACKUP_DEST")"

rm -rf "$BACKUP_DEST"

echo "$(date '+%Y-%m-%d %H:%M:%S') - Weekly backup completed and compressed" >> "$LOG_FILE"

find /home/$USER/backups/ -name "weekly_backup_*.tar.gz" -mtime +28 -delete
