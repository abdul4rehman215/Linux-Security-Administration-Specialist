#!/bin/bash
# File Management Automation Script

WORK_DIR="$HOME/file_management_demo"
LOG_FILE="$WORK_DIR/file_operations.log"

log_message() {
 echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

echo "=== File Management Automation ==="
log_message "Starting file management operations"

echo "Creating sample files..."
mkdir -p {documents,images,archives,scripts,temp}

for i in {1..5}; do
 echo "This is document $i" > "document_$i.txt"
 echo "This is a log entry $i" > "logfile_$i.log"
 touch "image_$i.jpg"
 touch "script_$i.sh"
 touch "archive_$i.zip"
done

touch -d "30 days ago" old_file_1.txt
touch -d "45 days ago" old_file_2.log
touch -d "60 days ago" very_old_file.tmp

log_message "Sample files created"

organize_files() {
 log_message "Starting file organization"

 for file in *.txt; do
  if [ -f "$file" ]; then
   mv "$file" documents/
   log_message "Moved $file to documents/"
  fi
 done

 for file in *.jpg *.png *.gif; do
  if [ -f "$file" ]; then
   mv "$file" images/
   log_message "Moved $file to images/"
  fi
 done

 for file in *.sh; do
  if [ -f "$file" ]; then
   mv "$file" scripts/
   log_message "Moved $file to scripts/"
  fi
 done

 for file in *.zip *.tar *.gz; do
  if [ -f "$file" ]; then
   mv "$file" archives/
   log_message "Moved $file to archives/"
  fi
 done

 for file in *.log *.tmp; do
  if [ -f "$file" ]; then
   mv "$file" temp/
   log_message "Moved $file to temp/"
  fi
 done
}

cleanup_old_files() {
 log_message "Starting cleanup of old files"

 find . -type f -mtime +30 -exec ls -la {} \; | while read -r line; do
  log_message "Found old file: $line"
 done

 log_message "Old file cleanup completed (files listed but not deleted for safety)"
}

generate_report() {
 log_message "Generating file report"

 REPORT_FILE="file_report_$(date +%Y%m%d_%H%M%S).txt"

 echo "File Management Report" > "$REPORT_FILE"
 echo "Generated: $(date)" >> "$REPORT_FILE"
 echo "Working Directory: $(pwd)" >> "$REPORT_FILE"
 echo "" >> "$REPORT_FILE"

 for dir in documents images archives scripts temp; do
  echo "=== $dir Directory ===" >> "$REPORT_FILE"
  if [ -d "$dir" ]; then
   file_count=$(find "$dir" -type f | wc -l)
   echo "File count: $file_count" >> "$REPORT_FILE"
   echo "Files:" >> "$REPORT_FILE"
   ls -la "$dir" >> "$REPORT_FILE"
  else
   echo "Directory not found" >> "$REPORT_FILE"
  fi
  echo "" >> "$REPORT_FILE"
 done

 log_message "Report generated: $REPORT_FILE"
}

echo "Current directory contents:"
ls -la
echo ""

echo "Organizing files..."
organize_files
echo ""

echo "Performing cleanup check..."
cleanup_old_files
echo ""

echo "Generating report..."
generate_report
echo ""

echo "Final directory structure:"
tree . 2>/dev/null || find . -type d | sort

log_message "File management operations completed"

echo ""
echo "Check the log file for detailed operations: $LOG_FILE"
