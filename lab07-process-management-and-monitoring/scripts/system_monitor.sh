#!/bin/bash
# System monitoring script

DATE=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="$HOME/process_monitoring/system_monitor.log"

echo "=== System Monitor Report - $DATE ===" >> "$LOG_FILE"

# CPU and Memory usage
echo "CPU and Memory Usage:" >> "$LOG_FILE"
top -bn1 | head -5 >> "$LOG_FILE"

# Top 5 CPU consuming processes
echo -e "\nTop 5 CPU consuming processes:" >> "$LOG_FILE"
ps aux --sort=-%cpu | head -6 >> "$LOG_FILE"

# Top 5 Memory consuming processes
echo -e "\nTop 5 Memory consuming processes:" >> "$LOG_FILE"
ps aux --sort=-%mem | head -6 >> "$LOG_FILE"

# Disk usage
echo -e "\nDisk Usage:" >> "$LOG_FILE"
df -h >> "$LOG_FILE"

echo -e "\n" >> "$LOG_FILE"
