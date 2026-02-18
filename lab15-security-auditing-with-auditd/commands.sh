# ==============================
# INSTALLATION & SERVICE SETUP
# ==============================

sudo apt update
sudo apt install auditd audispd-plugins -y

sudo systemctl start auditd
sudo systemctl enable auditd
sudo systemctl status auditd

sudo auditctl -s
sudo auditctl -l

sudo cat /etc/audit/auditd.conf | head -15


# ==============================
# BACKUP EXISTING RULES
# ==============================

sudo mkdir -p /etc/audit/backup
sudo cp /etc/audit/rules.d/audit.rules /etc/audit/backup/audit.rules.backup.$(date +%Y%m%d)


# ==============================
# LOAD RULES
# ==============================

sudo augenrules --load
sudo service auditd restart
sudo auditctl -l
sudo auditctl -l | wc -l


# ==============================
# IMMUTABLE MODE HANDLING
# ==============================

sudo auditctl -D
sudo reboot


# ==============================
# TEST ACTIVITIES
# ==============================

sudo useradd testuser1
sudo usermod -c "Test User for Audit Demo" testuser1
sudo userdel testuser1

sudo touch /tmp/suspicious_file.txt
echo "test content" | sudo tee /tmp/suspicious_file.txt

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
echo "# Test comment for audit" | sudo tee -a /etc/ssh/sshd_config
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config

echo "0 2 * * * /bin/echo 'test cron job'" | sudo tee -a /etc/crontab
sudo sed -i '/test cron job/d' /etc/crontab


# ==============================
# LOG ANALYSIS COMMANDS
# ==============================

sudo ausearch -k passwd_changes
sudo ausearch -k ssh_config_changes
sudo ausearch -k cron_changes
sudo ausearch -ts recent | head

sudo aureport
sudo aureport -u
sudo aureport -f


# ==============================
# ADVANCED RULE TESTING
# ==============================

touch /tmp/test_delete_file.txt
rm /tmp/test_delete_file.txt

touch /tmp/test_chmod_file.txt
chmod 755 /tmp/test_chmod_file.txt
rm /tmp/test_chmod_file.txt

touch /tmp/test_chown_file.txt
sudo chown root:root /tmp/test_chown_file.txt
sudo rm /tmp/test_chown_file.txt

sudo whoami
/bin/ls /tmp


# ==============================
# VERIFY EVENTS
# ==============================

sudo ausearch -k file_deletion -ts recent
sudo ausearch -k permission_changes -ts recent
sudo ausearch -k ownership_changes -ts recent
sudo ausearch -k sudo_usage -ts recent
sudo ausearch -k process_execution -ts recent | head -10


# ==============================
# RULE MANAGEMENT
# ==============================

sudo augenrules --check
sudo auditctl -l
sudo auditctl -l | wc -l


# ==============================
# PERFORMANCE & TROUBLESHOOTING
# ==============================

sudo systemctl status auditd -l
df -h /var/log/audit/
sudo auditctl -s
