#!/bin/bash

BACKUP_SOURCE="/home/$USER/backups/system_backup"
LOG_FILE="/home/$USER/backups/selective_restore.log"

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

restore_file() {
 local file_path="$1"
 local backup_file="$BACKUP_SOURCE/$file_path"
 local target_file="/home/$USER/$file_path"

 if [ -f "$backup_file" ]; then
  mkdir -p "$(dirname "$target_file")"
  cp "$backup_file" "$target_file"
  log_message "Restored: $file_path"
 else
  log_message "ERROR: File not found in backup: $file_path"
 fi
}

list_backup_files() {
 echo "Available files in backup:"
 find "$BACKUP_SOURCE" -type f -printf "%P\n" | head -20
 echo "..."
 echo "Total files: $(find "$BACKUP_SOURCE" -type f | wc -l)"
}

while true; do
 echo ""
 echo "=== Selective File Restoration ==="
 echo "1. List available backup files"
 echo "2. Restore specific file"
 echo "3. Restore multiple files"
 echo "4. Exit"
 echo ""

 read -p "Choose an option (1-4): " choice

 case $choice in
 1)
  list_backup_files
  ;;
 2)
  read -p "Enter file path to restore (relative to home): " file_path
  restore_file "$file_path"
  ;;
 3)
   echo "Enter file paths (one per line, empty line to finish):"
   while read -r file_path; do
    [ -z "$file_path" ] && break
    restore_file "$file_path"
   done
   ;;
 4)
   log_message "Selective restoration session ended"
   exit 0
   ;;
  *)
   echo "Invalid option. Please choose 1-4."
   ;;
 esac
done
