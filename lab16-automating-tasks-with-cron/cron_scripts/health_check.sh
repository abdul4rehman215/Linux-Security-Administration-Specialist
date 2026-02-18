#!/bin/bash
# Service health check script

LOG_FILE="$HOME/cron_logs/health_check.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "$DATE: Starting health check" >> $LOG_FILE

SERVICES=("cron" "systemd-logind")
ALL_HEALTHY=true

for service in "${SERVICES[@]}"; do
 if systemctl is-active --quiet $service; then
  echo "$DATE: $service is running - OK" >> $LOG_FILE
 else
  echo "$DATE: $service is not running - CRITICAL" >> $LOG_FILE
  ALL_HEALTHY=false
 fi
done

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $DISK_USAGE -lt 80 ]; then
 echo "$DATE: Disk usage is ${DISK_USAGE}% - OK" >> $LOG_FILE
else
 echo "$DATE: Disk usage is ${DISK_USAGE}% - WARNING" >> $LOG_FILE
 ALL_HEALTHY=false
fi

MEM_USAGE=$(free | awk 'NR==2{printf "%.0f", $3*100/$2}')

if [ $MEM_USAGE -lt 90 ]; then
 echo "$DATE: Memory usage is ${MEM_USAGE}% - OK" >> $LOG_FILE
else
 echo "$DATE: Memory usage is ${MEM_USAGE}% - WARNING" >> $LOG_FILE
 ALL_HEALTHY=false
fi

if [ "$ALL_HEALTHY" = true ]; then
 echo "$DATE: Overall system health - GOOD" >> $LOG_FILE
else
 echo "$DATE: Overall system health - NEEDS ATTENTION" >> $LOG_FILE
fi

echo "----------------------------------------" >> $LOG_FILE
