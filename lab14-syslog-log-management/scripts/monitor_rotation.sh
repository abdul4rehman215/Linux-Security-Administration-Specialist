#!/bin/bash

echo "=== Log Rotation Status ==="
echo "Current log files:"
ls -lh /var/log/testapp/

echo -e "\n=== Logrotate Status ==="
sudo cat /var/lib/logrotate/status | grep testapp

echo -e "\n=== Recent Rotation Activity ==="
if [ -f /var/log/testapp/rotation.log ]; then
 cat /var/log/testapp/rotation.log
fi
