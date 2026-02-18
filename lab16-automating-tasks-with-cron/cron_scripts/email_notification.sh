#!/bin/bash
# Email notification script (simulated)

LOG_FILE="$HOME/cron_logs/notifications.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
ALERT_FILE="$HOME/cron_logs/alerts.txt"

send_email() {
 local subject="$1"
 local message="$2"
 local recipient="$3"

 echo "$DATE: EMAIL SENT" >> $LOG_FILE
 echo "To: $recipient" >> $LOG_FILE
 echo "Subject: $subject" >> $LOG_FILE
 echo "Message: $message" >> $LOG_FILE
 echo "----------------------------------------" >> $LOG_FILE
}

if [ -f "$ALERT_FILE" ]; then
 ALERT_COUNT=$(wc -l < "$ALERT_FILE")

 if [ $ALERT_COUNT -gt 0 ]; then
  ALERTS=$(cat "$ALERT_FILE")

  send_email "System Alerts - $ALERT_COUNT issues found" "$ALERTS" "admin@example.com"

  mv "$ALERT_FILE" "$HOME/cron_logs/alerts_$(date +%Y%m%d_%H%M%S).txt"
 fi
fi

HOUR=$(date +%H)

if [ "$HOUR" = "09" ]; then
 SUMMARY="Daily system summary:\n"
 SUMMARY+="- System uptime: $(uptime -p)\n"
 SUMMARY+="- Disk usage: $(df -h / | awk 'NR==2 {print $5}')\n"
 SUMMARY+="- Memory usage: $(free -h | awk 'NR==2 {print $3\"/\"$2}')\n"

 send_email "Daily System Summary" "$SUMMARY" "admin@example.com"
fi
