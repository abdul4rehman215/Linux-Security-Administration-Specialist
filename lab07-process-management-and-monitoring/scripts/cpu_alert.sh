#!/bin/bash

THRESHOLD=80
LOG_FILE="$HOME/process_monitoring/cpu_alerts.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
CPU_USAGE=${CPU_USAGE%.*}

if [ "$CPU_USAGE" -gt "$THRESHOLD" ]; then
 echo "$DATE - HIGH CPU USAGE ALERT: ${CPU_USAGE}%" >> "$LOG_FILE"
 echo "Top CPU consuming processes:" >> "$LOG_FILE"
 ps aux --sort=-%cpu | head -10 >> "$LOG_FILE"
 echo "---" >> "$LOG_FILE"
fi
