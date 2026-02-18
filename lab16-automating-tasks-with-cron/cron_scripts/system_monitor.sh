#!/bin/bash
# System monitoring script

LOG_FILE="$HOME/cron_logs/system_monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "=== System Monitor Report - $DATE ===" >> $LOG_FILE

echo "CPU Usage:" >> $LOG_FILE
top -bn1 | grep "Cpu(s)" >> $LOG_FILE

echo "Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE

echo "Disk Usage:" >> $LOG_FILE
df -h / >> $LOG_FILE

echo "Load Average:" >> $LOG_FILE
uptime >> $LOG_FILE

echo "----------------------------------------" >> $LOG_FILE
echo "" >> $LOG_FILE
