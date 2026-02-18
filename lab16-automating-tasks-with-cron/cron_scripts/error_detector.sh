#!/bin/bash
# Error detection and alerting script

ERROR_LOG="$HOME/cron_logs/errors.log"
ALERT_FILE="$HOME/cron_logs/alerts.txt"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

log_error() {
 local error_msg="$1"
 echo "$DATE: ERROR - $error_msg" >> $ERROR_LOG
 echo "$DATE: $error_msg" >> $ALERT_FILE
}

echo "$DATE: Starting error detection" >> $ERROR_LOG

for script in ~/cron_scripts/*.sh; do
 script_name=$(basename "$script")

 if [ "$script_name" = "error_detector.sh" ]; then
  continue
 fi

 if [ ! -x "$script" ]; then
  log_error "Script $script_name is not executable"
 fi
done

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 90 ]; then
 log_error "Disk usage critical: ${DISK_USAGE}%"
fi

find ~/cron_logs -name "*.log" -size +10M -exec basename {} \; | while read large_file; do
 log_error "Log file $large_file is larger than 10MB"
done

if ! systemctl is-active --quiet cron; then
 log_error "Cron service is not running"
fi

echo "$DATE: Error detection completed" >> $ERROR_LOG
