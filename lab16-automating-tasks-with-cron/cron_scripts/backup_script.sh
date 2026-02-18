#!/bin/bash
# Simple backup script

BACKUP_DIR="$HOME/backups"
DATE=$(date '+%Y%m%d_%H%M%S')
LOG_FILE="$HOME/cron_logs/backup.log"

mkdir -p $BACKUP_DIR

tar -czf "$BACKUP_DIR/home_backup_$DATE.tar.gz" -C $HOME \
 --exclude='backups' \
 --exclude='cron_logs' \
 . 2>/dev/null

if [ $? -eq 0 ]; then
 echo "$(date): Backup completed successfully - home_backup_$DATE.tar.gz" >> $LOG_FILE
else
 echo "$(date): Backup failed" >> $LOG_FILE
fi

cd $BACKUP_DIR
ls -t home_backup_*.tar.gz | tail -n +6 | xargs -r rm
