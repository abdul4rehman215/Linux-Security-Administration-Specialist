#!/bin/bash
# Cron monitoring script

MONITOR_LOG="$HOME/cron_logs/cron_monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "$DATE: Cron monitor executed" >> $MONITOR_LOG

echo "$DATE: Recent cron activity:" >> $MONITOR_LOG
sudo grep CRON /var/log/syslog 2>/dev/null | tail -5 >> $MONITOR_LOG 2>/dev/null || echo "No system cron logs available" >> $MONITOR_LOG

echo "$DATE: Current user cron jobs:" >> $MONITOR_LOG
crontab -l >> $MONITOR_LOG 2>/dev/null || echo "No cron jobs found" >> $MONITOR_LOG

echo "----------------------------------------" >> $MONITOR_LOG
