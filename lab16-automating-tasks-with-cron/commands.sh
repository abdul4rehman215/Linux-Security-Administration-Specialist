#!/bin/bash
# Lab 16 - Automating Tasks with Cron
# Commands Executed

# ===============================
# Task 1: Cron Service Setup
# ===============================

sudo systemctl status cron
sudo systemctl start cron
sudo systemctl enable cron

ls -la /etc/cron*
sudo ls -la /var/spool/cron/crontabs/
crontab -l

nano ~/cron_syntax_reference.txt
cat ~/cron_syntax_reference.txt


# ===============================
# Task 2: Creating Basic Cron Jobs
# ===============================

mkdir -p ~/cron_scripts
mkdir -p ~/cron_logs

nano ~/cron_scripts/date_logger.sh
chmod +x ~/cron_scripts/date_logger.sh
~/cron_scripts/date_logger.sh
cat ~/cron_logs/date_log.txt

(crontab -l 2>/dev/null; echo "* * * * * $HOME/cron_scripts/date_logger.sh") | crontab -
crontab -l

sleep 240
cat ~/cron_logs/date_log.txt
wc -l ~/cron_logs/date_log.txt


# ===============================
# Create Advanced Scripts
# ===============================

nano ~/cron_scripts/system_monitor.sh
chmod +x ~/cron_scripts/system_monitor.sh

nano ~/cron_scripts/backup_script.sh
chmod +x ~/cron_scripts/backup_script.sh

nano ~/cron_scripts/cleanup_script.sh
chmod +x ~/cron_scripts/cleanup_script.sh


# ===============================
# Schedule Multiple Cron Jobs
# ===============================

crontab -r

nano ~/temp_crontab
crontab ~/temp_crontab
crontab -l
rm ~/temp_crontab


# ===============================
# Task 3: Advanced Automation
# ===============================

nano ~/cron_scripts/db_maintenance.sh
chmod +x ~/cron_scripts/db_maintenance.sh
~/cron_scripts/db_maintenance.sh
tail -5 ~/cron_logs/db_maintenance.log

nano ~/cron_scripts/health_check.sh
chmod +x ~/cron_scripts/health_check.sh
~/cron_scripts/health_check.sh
tail -6 ~/cron_logs/health_check.log

nano ~/cron_scripts/email_notification.sh
chmod +x ~/cron_scripts/email_notification.sh
~/cron_scripts/email_notification.sh
ls ~/cron_logs/

nano ~/temp_crontab
crontab ~/temp_crontab
rm ~/temp_crontab
crontab -l


# ===============================
# Task 4: Monitoring & Logs
# ===============================

echo "=== System Cron Logs ==="
sudo tail -20 /var/log/cron 2>/dev/null || sudo tail -20 /var/log/syslog | grep CRON
sudo grep -i cron /etc/rsyslog.conf 2>/dev/null || echo "Rsyslog config not accessible"

nano ~/cron_scripts/cron_monitor.sh
chmod +x ~/cron_scripts/cron_monitor.sh
~/cron_scripts/cron_monitor.sh
tail -6 ~/cron_logs/cron_monitor.log

nano ~/cron_scripts/cron_dashboard.sh
chmod +x ~/cron_scripts/cron_dashboard.sh
~/cron_scripts/cron_dashboard.sh
ls -lh ~/cron_logs/dashboard.html

nano ~/cron_scripts/error_detector.sh
chmod +x ~/cron_scripts/error_detector.sh
~/cron_scripts/error_detector.sh
tail -5 ~/cron_logs/errors.log

nano ~/temp_crontab
crontab ~/temp_crontab
rm ~/temp_crontab

echo "Comprehensive cron monitoring solution installed!"
crontab -l


# ===============================
# Verification & Testing
# ===============================

sleep 300

echo "=== Checking Log Files ==="
for log_file in ~/cron_logs/*.log ~/cron_logs/*.txt; do
 if [ -f "$log_file" ]; then
  echo "--- $(basename $log_file) ---"
  tail -3 "$log_file"
  echo ""
 fi
done

echo "HTML Dashboard: ~/cron_logs/dashboard.html"
echo "Active cron jobs: $(crontab -l | grep -v '^#' | grep -v '^$' | wc -l)"

nano ~/verify_lab.sh
chmod +x ~/verify_lab.sh
~/verify_lab.sh


# ===============================
# Troubleshooting Debug Script
# ===============================

cat > ~/cron_scripts/debug_script.sh << 'EOF'
#!/bin/bash
DEBUG_LOG="$HOME/cron_logs/debug.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
echo "$DATE: Debug script started" >> $DEBUG_LOG
echo "$DATE: Current PATH: $PATH" >> $DEBUG_LOG
echo "$DATE: Current USER: $USER" >> $DEBUG_LOG
echo "$DATE: Current PWD: $PWD" >> $DEBUG_LOG
echo "$DATE: Home directory: $HOME" >> $DEBUG_LOG
echo "----------------------------------------" >> $DEBUG_LOG
EOF

chmod +x ~/cron_scripts/debug_script.sh
(crontab -l; echo "*/5 * * * * $HOME/cron_scripts/debug_script.sh") | crontab -
chmod +x ~/cron_scripts/*.sh
chmod 755 ~/cron_scripts/
chmod 755 ~/cron_logs/
ls -la ~/cron_scripts/
ls -la ~/cron_logs/
