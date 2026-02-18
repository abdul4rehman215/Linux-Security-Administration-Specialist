#!/bin/bash
# Simple service script

LOG_FILE="/var/log/myservice.log"

while true; do
 echo "$(date): MyService is running - PID: $$" >> $LOG_FILE
 sleep 30
done
