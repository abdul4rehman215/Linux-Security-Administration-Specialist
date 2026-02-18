#!/bin/bash
# System Restoration Script

BACKUP_SOURCE="/home/$USER/backups/system_backup"
RESTORE_TARGET="/home/$USER"
LOG_FILE="/home/$USER/backups/restore.log"
DATE=$(date +%Y%m%d_%H%M%S)

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

confirm_restore() {
 echo "WARNING: This will overwrite existing files in $RESTORE_TARGET"
 echo "Are you sure you want to continue? (yes/no)"
 read -r response
 if [ "$response" != "yes" ]; then
  log_message "Restoration cancelled by user"
  exit 0
 fi
}

if [ ! -d "$BACKUP_SOURCE" ]; then
 log_message "ERROR: Backup source not found: $BACKUP_SOURCE"
 exit 1
fi

log_message "Starting system restoration from $BACKUP_SOURCE"

confirm_restore

PRE_RESTORE_BACKUP="/home/$USER/backups/pre_restore_backup_$DATE"
log_message "Creating pre-restoration backup at $PRE_RESTORE_BACKUP"

rsync -av "$RESTORE_TARGET/" "$PRE_RESTORE_BACKUP/" 2>&1 | tee -a "$LOG_FILE"

log_message "Performing system restoration..."

rsync -av \
 --delete \
 --stats \
 "$BACKUP_SOURCE/" \
 "$RESTORE_TARGET/" 2>&1 | tee -a "$LOG_FILE"

if [ ${PIPESTATUS[0]} -eq 0 ]; then
 log_message "System restoration completed successfully"

 RESTORED_FILES=$(find "$RESTORE_TARGET" -type f | wc -l)
 RESTORED_SIZE=$(du -sh "$RESTORE_TARGET" | cut -f1)

 log_message "Restoration Statistics:"
 log_message "- Files restored: $RESTORED_FILES"
 log_message "- Total size: $RESTORED_SIZE"
 log_message "- Pre-restoration backup saved at: $PRE_RESTORE_BACKUP"
else
 log_message "ERROR: System restoration failed"
 exit 1
fi

log_message "Restoration process completed"
