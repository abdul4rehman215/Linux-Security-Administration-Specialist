#!/bin/bash

LOG_FILE="${LOG_PATH:-/var/log/advanced-service.log}"
SERVICE_NAME="${SERVICE_NAME:-AdvancedService}"
INTERVAL="${SLEEP_INTERVAL:-15}"

echo "Starting $SERVICE_NAME with interval $INTERVAL seconds" >> $LOG_FILE

while true; do
 echo "$(date): $SERVICE_NAME is active - Environment: $ENVIRONMENT" >> $LOG_FILE
 sleep $INTERVAL
done
