#!/bin/bash
# ==========================================
# Sudo Activity Monitor Script
# Enterprise sudo monitoring automation
# ==========================================

LOG_FILE="/var/log/sudo.log"
ALERT_EMAIL="admin@company.com"
TEMP_FILE="/tmp/sudo-monitor.tmp"

# ------------------------------------------
# Function: Send Security Alert
# ------------------------------------------
send_alert() {
 local message="$1"
 echo "SUDO SECURITY ALERT: $message" | logger -p auth.warning -t sudo-monitor
 # Uncomment to enable email alerts:
 # echo "$message" | mail -s "Sudo Security Alert" "$ALERT_EMAIL"
}

# ------------------------------------------
# Check for Dangerous Commands
# ------------------------------------------
check_suspicious_commands() {

 DANGEROUS_COMMANDS="rm -rf|mkfs|fdisk|dd if=|passwd root|userdel|usermod -u 0"

 if tail -n 100 "$LOG_FILE" | grep -E "$DANGEROUS_COMMANDS" > "$TEMP_FILE"; then
  send_alert "Dangerous sudo commands detected: $(cat $TEMP_FILE)"
 fi
}

# ------------------------------------------
# Check for Failed Authentication Attempts
# ------------------------------------------
check_failed_attempts() {

 FAILED_COUNT=$(tail -n 100 "$LOG_FILE" | grep -c "authentication failure")

 if [ "$FAILED_COUNT" -gt 5 ]; then
  send_alert "Multiple sudo authentication failures detected: $FAILED_COUNT attempts"
 fi
}

# ------------------------------------------
# Detect Unusual Usage (Outside Business Hours)
# ------------------------------------------
check_unusual_patterns() {

 CURRENT_HOUR=$(date +%H)

 if [ "$CURRENT_HOUR" -lt 9 ] || [ "$CURRENT_HOUR" -gt 18 ]; then
  RECENT_SUDO=$(tail -n 10 "$LOG_FILE" | grep "$(date +%Y-%m-%d)")
  if [ -n "$RECENT_SUDO" ]; then
   send_alert "Sudo activity detected outside business hours: $RECENT_SUDO"
  fi
 fi
}

# ------------------------------------------
# Main Execution
# ------------------------------------------
if [ -f "$LOG_FILE" ]; then
 check_suspicious_commands
 check_failed_attempts
 check_unusual_patterns

 rm -f "$TEMP_FILE"
else
 send_alert "Sudo log file not found: $LOG_FILE"
fi
