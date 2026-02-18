#!/bin/bash
# Cron job status dashboard

DASHBOARD_FILE="$HOME/cron_logs/dashboard.html"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

cat > $DASHBOARD_FILE << HTML_EOF
<!DOCTYPE html>
<html>
<head>
 <title>Cron Job Dashboard</title>
 <style>
 body { font-family: Arial, sans-serif; margin: 20px; }
 .header { background-color: #f0f0f0; padding: 10px; border-radius: 5px; }
 .section { margin: 20px 0; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
 .success { color: green; }
 .warning { color: orange; }
 .error { color: red; }
 pre { background-color: #f5f5f5; padding: 10px; overflow-x: auto; }
 </style>
</head>
<body>
 <div class="header">
 <h1>Cron Job Dashboard</h1>
 <p>Generated: $DATE</p>
 </div>
HTML_EOF

echo " <div class=\"section\">" >> $DASHBOARD_FILE
echo " <h2>Active Cron Jobs</h2>" >> $DASHBOARD_FILE
echo " <pre>" >> $DASHBOARD_FILE
crontab -l >> $DASHBOARD_FILE 2>/dev/null || echo "No cron jobs configured" >> $DASHBOARD_FILE
echo " </pre>" >> $DASHBOARD_FILE
echo " </div>" >> $DASHBOARD_FILE

echo " <div class=\"section\">" >> $DASHBOARD_FILE
echo " <h2>Recent Activity</h2>" >> $DASHBOARD_FILE

echo " <h3>Date Logger</h3>" >> $DASHBOARD_FILE
echo " <pre>" >> $DASHBOARD_FILE
tail -5 ~/cron_logs/date_log.txt 2>/dev/null >> $DASHBOARD_FILE || echo "No date log found" >> $DASHBOARD_FILE
echo " </pre>" >> $DASHBOARD_FILE

echo " <h3>System Monitor</h3>" >> $DASHBOARD_FILE
echo " <pre>" >> $DASHBOARD_FILE
tail -10 ~/cron_logs/system_monitor.log 2>/dev/null >> $DASHBOARD_FILE || echo "No system monitor log found" >> $DASHBOARD_FILE
echo " </pre>" >> $DASHBOARD_FILE

echo " <h3>Health Check</h3>" >> $DASHBOARD_FILE
echo " <pre>" >> $DASHBOARD_FILE
tail -10 ~/cron_logs/health_check.log 2>/dev/null >> $DASHBOARD_FILE || echo "No health check log found" >> $DASHBOARD_FILE
echo " </pre>" >> $DASHBOARD_FILE

echo " </div>" >> $DASHBOARD_FILE

cat >> $DASHBOARD_FILE << HTML_EOF
</body>
</html>
HTML_EOF

echo "Dashboard updated: $DASHBOARD_FILE"
