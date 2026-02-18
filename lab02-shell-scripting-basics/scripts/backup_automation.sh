#!/bin/bash
# Backup Automation Script

SOURCE_DIR="$HOME/shell_scripts"
BACKUP_BASE_DIR="$HOME/backups"
DATE_STAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$BACKUP_BASE_DIR/backup_$DATE_STAMP"
LOG_FILE="$BACKUP_BASE_DIR/backup.log"
MAX_BACKUPS=5

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

create_backup_dir() {
 if [ ! -d "$BACKUP_BASE_DIR" ]; then
  mkdir -p "$BACKUP_BASE_DIR"
  log_message "Created backup base directory: $BACKUP_BASE_DIR"
 fi

 mkdir -p "$BACKUP_DIR"
 log_message "Created backup directory: $BACKUP_DIR"
}

perform_backup() {
 log_message "Starting backup process"
 log_message "Source: $SOURCE_DIR"
 log_message "Destination: $BACKUP_DIR"

 if [ ! -d "$SOURCE_DIR" ]; then
  log_message "ERROR: Source directory does not exist"
  return 1
 fi

 cp -r "$SOURCE_DIR"/* "$BACKUP_DIR/" 2>/dev/null

 if [ $? -eq 0 ]; then
  log_message "Backup completed successfully"
 else
  log_message "WARNING: Some files may not have been copied"
 fi

 SUMMARY_FILE="$BACKUP_DIR/backup_summary.txt"
 echo "Backup Summary" > "$SUMMARY_FILE"
 echo "Date: $(date)" >> "$SUMMARY_FILE"
 echo "Source: $SOURCE_DIR" >> "$SUMMARY_FILE"
 echo "Destination: $BACKUP_DIR" >> "$SUMMARY_FILE"
 echo "" >> "$SUMMARY_FILE"
 echo "Files backed up:" >> "$SUMMARY_FILE"
 find "$BACKUP_DIR" -type f -not -name "backup_summary.txt" >> "$SUMMARY_FILE"

 BACKUP_SIZE=$(du -sh "$BACKUP_DIR" | cut -f1)
 echo "" >> "$SUMMARY_FILE"
 echo "Total backup size: $BACKUP_SIZE" >> "$SUMMARY_FILE"

 log_message "Backup size: $BACKUP_SIZE"
}

cleanup_old_backups() {
 log_message "Checking for old backups"

 BACKUP_COUNT=$(find "$BACKUP_BASE_DIR" -maxdepth 1 -type d -name "backup_*" | wc -l)
 log_message "Current backup count: $BACKUP_COUNT"

 if [ "$BACKUP_COUNT" -gt "$MAX_BACKUPS" ]; then
  EXCESS_COUNT=$((BACKUP_COUNT - MAX_BACKUPS))
  log_message "Removing $EXCESS_COUNT old backup(s)"

  find "$BACKUP_BASE_DIR" -maxdepth 1 -type d -name "backup_*" | sort | head -n "$EXCESS_COUNT" |
  while read -r old_backup; do
   log_message "Removing old backup: $old_backup"
   rm -rf "$old_backup"
  done
 else
  log_message "No cleanup needed"
 fi
}

verify_backup() {
 log_message "Verifying backup integrity"

 SOURCE_COUNT=$(find "$SOURCE_DIR" -type f | wc -l)
 BACKUP_COUNT=$(find "$BACKUP_DIR" -type f -not -name "backup_summary.txt" | wc -l)

 log_message "Source files: $SOURCE_COUNT"
 log_message "Backed up files: $BACKUP_COUNT"

 if [ "$SOURCE_COUNT" -eq "$BACKUP_COUNT" ]; then
  log_message "Backup verification: PASSED"
 else
  log_message "Backup verification: FAILED"
 fi
}

generate_backup_report() {
 REPORT_FILE="$BACKUP_BASE_DIR/backup_report_$DATE_STAMP.txt"

 echo "Backup Report" > "$REPORT_FILE"
 echo "Generated: $(date)" >> "$REPORT_FILE"
 echo "Backup Directory: $BACKUP_DIR" >> "$REPORT_FILE"
 echo "" >> "$REPORT_FILE"

 echo "=== Backup Statistics ===" >> "$REPORT_FILE"
 echo "Total backups: $(find "$BACKUP_BASE_DIR" -maxdepth 1 -type d -name "backup_*" | wc -l)" >> "$REPORT_FILE"
 echo "Latest backup size: $(du -sh "$BACKUP_DIR" | cut -f1)" >> "$REPORT_FILE"
 echo "Total backup storage used: $(du -sh "$BACKUP_BASE_DIR" | cut -f1)" >> "$REPORT_FILE"
 echo "" >> "$REPORT_FILE"

 echo "=== Available Backups ===" >> "$REPORT_FILE"
 find "$BACKUP_BASE_DIR" -maxdepth 1 -type d -name "backup_*" | sort >> "$REPORT_FILE"

 log_message "Backup report generated: $REPORT_FILE"
}

echo "=== Backup Automation Script ==="
log_message "Backup automation started"

if [ ! -d "$SOURCE_DIR" ]; then
 echo "Source directory not found. Creating sample files..."
 mkdir -p "$SOURCE_DIR"
 echo "Sample file 1" > "$SOURCE_DIR/sample1.txt"
 echo "Sample file 2" > "$SOURCE_DIR/sample2.txt"
 echo "Sample script" > "$SOURCE_DIR/sample.sh"
 log_message "Created sample source files"
fi

create_backup_dir
perform_backup

if [ $? -eq 0 ]; then
 verify_backup
 cleanup_old_backups
 generate_backup_report

 echo ""
 echo "Backup completed successfully!"
 echo "Backup location: $BACKUP_DIR"
 echo "Log file: $LOG_FILE"

 if [ -f "$BACKUP_DIR/backup_summary.txt" ]; then
  echo ""
  echo "=== Backup Summary ==="
  cat "$BACKUP_DIR/backup_summary.txt"
 fi
else
 echo "Backup failed!"
fi

log_message "Backup automation completed"
