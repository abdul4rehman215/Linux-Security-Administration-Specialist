#!/bin/bash

LOG_FILE="/var/log/problem-service.log"

echo "$(date): Problem service started successfully" >> $LOG_FILE

while true; do
 echo "$(date): Service running normally" >> $LOG_FILE
 sleep 60
done
