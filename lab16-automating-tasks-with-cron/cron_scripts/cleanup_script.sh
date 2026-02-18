#!/bin/bash
# Cleanup old log files

LOG_FILE="$HOME/cron_logs/cleanup.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "$DATE: Starting cleanup process" >> $LOG_FILE

find $HOME/cron_logs -name "*.log" -type f -mtime +7 -delete 2>/dev/null
find /tmp -name "tmp*" -user $USER -mtime +1 -delete 2>/dev/null

echo "$DATE: Cleanup process completed" >> $LOG_FILE
