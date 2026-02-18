#!/bin/bash

BACKUP_SOURCE="/home/$USER/backups/system_backup"
RESTORE_TARGET="/home/$USER"
LOG_FILE="/home/$USER/backups/restoration_verification.log"

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Starting restoration verification..."

BACKUP_COUNT=$(find "$BACKUP_SOURCE" -type f | wc -l)
RESTORE_COUNT=$(find "$RESTORE_TARGET" -type f | wc -l)

log_message "File count comparison:"
log_message "- Backup files: $BACKUP_COUNT"
log_message "- Restored files: $RESTORE_COUNT"

CRITICAL_FILES=(
 "important_data/document1.txt"
 "important_data/document2.txt"
 "important_data/config.conf"
 "important_data/subdirectory/nested_file.txt"
)

log_message "Verifying critical files:"

for file in "${CRITICAL_FILES[@]}"; do
 backup_file="$BACKUP_SOURCE/$file"
 restore_file="$RESTORE_TARGET/$file"

 if [ -f "$backup_file" ] && [ -f "$restore_file" ]; then
  if cmp -s "$backup_file" "$restore_file"; then
   log_message "✓ VERIFIED: $file matches backup"
  else
   log_message "✗ ERROR: $file differs from backup"
  fi
 else
  log_message "✗ ERROR: $file missing in backup or restoration"
 fi
done

log_message "Checking file permissions:"

for file in "${CRITICAL_FILES[@]}"; do
 backup_file="$BACKUP_SOURCE/$file"
 restore_file="$RESTORE_TARGET/$file"

 if [ -f "$backup_file" ] && [ -f "$restore_file" ]; then
  backup_perms=$(stat -c "%a" "$backup_file")
  restore_perms=$(stat -c "%a" "$restore_file")

  if [ "$backup_perms" = "$restore_perms" ]; then
   log_message "✓ PERMISSIONS OK: $file ($restore_perms)"
  else
   log_message "✗ PERMISSIONS DIFFER: $file (backup: $backup_perms, restored: $restore_perms)"
  fi
 fi
done

log_message "Restoration verification completed"
