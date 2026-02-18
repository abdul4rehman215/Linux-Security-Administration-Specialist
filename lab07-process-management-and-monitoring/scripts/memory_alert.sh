#!/bin/bash

THRESHOLD=80
LOG_FILE="$HOME/process_monitoring/memory_alerts.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

MEMORY_USAGE=$(free | grep Mem | awk '{printf("%.0f", $3/$2 * 100.0)}')

if [ "$MEMORY_USAGE" -gt "$THRESHOLD" ]; then
 echo "$DATE - HIGH MEMORY USAGE ALERT: ${MEMORY_USAGE}%" >> "$LOG_FILE"
 echo "Top memory consuming processes:" >> "$LOG_FILE"
 ps aux --sort=-%mem | head -10 >> "$LOG_FILE"
 echo "---" >> "$LOG_FILE"
fi
