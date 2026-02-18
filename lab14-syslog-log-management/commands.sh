# =========================================
# Task 1: rsyslog Verification & Setup
# =========================================

dpkg -l | grep rsyslog
sudo systemctl status rsyslog
sudo cat /etc/rsyslog.conf
ls -la /etc/rsyslog.d/
sudo cp /etc/rsyslog.conf /etc/rsyslog.conf.backup

sudo nano /etc/rsyslog.conf
sudo nano /etc/rsyslog.d/10-remote.conf

sudo mkdir -p /var/log/remote/localhost
sudo chown syslog:adm /var/log/remote/localhost
sudo chmod 755 /var/log/remote/localhost

sudo systemctl restart rsyslog
sudo netstat -tulpn | grep :514

logger -p local0.info "This is a test message from local system"
logger -t remote-testapp -p local1.warning "This is a simulated remote application warning"

sudo tail -f /var/log/syslog &
sleep 2
logger -p user.notice "Testing user facility logging"
sleep 2
kill %1

sudo ls -la /var/log/remote/localhost/
sudo cat /var/log/remote/localhost/remote-testapp.log

# =========================================
# Task 2: journalctl Usage
# =========================================

journalctl
journalctl -f
journalctl -b
journalctl -b -1
journalctl -n 50
journalctl -u rsyslog
journalctl -p err
journalctl --since "1 hour ago"

logger -p user.err "Error message for testing"
logger -t security "Failed login attempt detected"
journalctl -t security

journalctl --disk-usage
sudo journalctl --vacuum-time=2d

# =========================================
# Task 3: logrotate Configuration
# =========================================

sudo cat /etc/logrotate.conf
ls -la /etc/logrotate.d/
sudo cat /etc/logrotate.d/rsyslog

sudo mkdir -p /var/log/testapp
sudo touch /var/log/testapp/application.log
sudo touch /var/log/testapp/error.log
sudo touch /var/log/testapp/access.log
sudo chown syslog:adm /var/log/testapp/*.log
sudo chmod 644 /var/log/testapp/*.log

nano /tmp/generate_logs.sh
chmod +x /tmp/generate_logs.sh
/tmp/generate_logs.sh
ls -lh /var/log/testapp/

sudo nano /etc/logrotate.d/testapp
sudo logrotate -d /etc/logrotate.d/testapp
sudo logrotate -f /etc/logrotate.d/testapp
ls -lh /var/log/testapp/

sudo nano /etc/logrotate.d/testapp-advanced
/tmp/generate_logs.sh
sudo logrotate -f /etc/logrotate.d/testapp-advanced
cat /var/log/testapp/rotation.log

nano /tmp/monitor_rotation.sh
chmod +x /tmp/monitor_rotation.sh
/tmp/monitor_rotation.sh

nano /tmp/log_analysis.sh
chmod +x /tmp/log_analysis.sh
/tmp/log_analysis.sh

# =========================================
# Final Validation
# =========================================

logger -p local0.info "Final test: Local message"
logger -t remote-final -p local1.warning "Final test: Remote simulation"
sleep 2

sudo tail -5 /var/log/syslog
sudo tail -5 /var/log/remote/localhost/remote-final.log
journalctl -n 5 --no-pager

sudo logrotate -f /etc/logrotate.d/testapp
ls -la /var/log/testapp/
