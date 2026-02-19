#!/bin/bash
# Lab 19 - Configuring SELinux for Security
# Commands Executed

# ===============================
# Environment Verification
# ===============================

cat /etc/os-release
sestatus
getenforce
cat /etc/selinux/config

# ===============================
# Task 1 - Understanding Contexts
# ===============================

ls -Z /etc/passwd /etc/shadow /etc/hosts
ls -dZ /var/www/html /home /tmp
id -Z

# ===============================
# Create Web Test Structure
# ===============================

mkdir -p /opt/webtest/{public,private,logs}
echo "Public content" > /opt/webtest/public/index.html
echo "Private data" > /opt/webtest/private/secret.txt
echo "Log entry" > /opt/webtest/logs/access.log

ls -lZ /opt/webtest/
ls -lZ /opt/webtest/public/

# ===============================
# Install SELinux Management Tools
# ===============================

yum install -y policycoreutils-python

# ===============================
# Configure File Contexts
# ===============================

semanage fcontext -a -t httpd_sys_content_t "/opt/webtest/public(/.*)?"
semanage fcontext -a -t admin_home_t "/opt/webtest/private(/.*)?"
semanage fcontext -a -t httpd_log_t "/opt/webtest/logs(/.*)?"

restorecon -Rv /opt/webtest/
ls -lZ /opt/webtest/

# ===============================
# Install and Configure Apache
# ===============================

yum install -y httpd
systemctl start httpd
systemctl enable httpd

ln -s /opt/webtest/public /var/www/html/testsite
curl http://localhost/testsite/index.html

getsebool -a | grep httpd | head -5

# ===============================
# Task 2 - Generate SELinux Denial
# ===============================

nano /tmp/test_script.sh
chmod +x /tmp/test_script.sh

mkdir -p /var/www/cgi-bin
cp /tmp/test_script.sh /var/www/cgi-bin/

ls -lZ /var/www/cgi-bin/test_script.sh

setsebool -P httpd_enable_cgi on
curl http://localhost/cgi-bin/test_script.sh

# ===============================
# Audit Log Analysis
# ===============================

ausearch -m AVC -ts recent
journalctl -t setroubleshoot --since="10 minutes ago"
sealert -a /var/log/audit/audit.log
grep "SELinux" /var/log/messages | tail -5

# ===============================
# Generate Policy Using audit2allow
# ===============================

ausearch -m AVC -ts recent | audit2allow
ausearch -m AVC -ts recent | audit2allow -M mypolicy
cat mypolicy.te
ls -l mypolicy.*

# ===============================
# Custom Application Test
# ===============================

nano /opt/custom_app.sh
chmod +x /opt/custom_app.sh
/opt/custom_app.sh

ausearch -m AVC -ts recent | tail -10
ausearch -m AVC -ts recent | audit2allow -M custom_app_policy
cat custom_app_policy.te

semodule -i custom_app_policy.pp
semodule -l | grep custom

/opt/custom_app.sh
ausearch -m AVC -ts recent | grep custom_app || echo "No denials found"

ls -lZ /var/log/custom_app.log
cat /var/log/custom_app.log

# ===============================
# Task 3 - Create Custom SELinux Policy
# ===============================

mkdir -p /opt/myapp/{bin,config,data,logs}

nano /opt/myapp/bin/myapp
chmod +x /opt/myapp/bin/myapp

nano /opt/myapp/config/app.conf
echo "Sample data file" > /opt/myapp/data/sample.txt

nano myapp_policy.te
nano myapp_policy.fc

yum install -y selinux-policy-devel

make -f /usr/share/selinux/devel/Makefile myapp_policy.pp
semodule -i myapp_policy.pp
semodule -l | grep myapp

semanage fcontext -a -t myapp_exec_t "/opt/myapp/bin/myapp"
semanage fcontext -a -t myapp_config_t "/opt/myapp/config(/.*)?"
semanage fcontext -a -t myapp_data_t "/opt/myapp/data(/.*)?"
semanage fcontext -a -t myapp_log_t "/opt/myapp/logs(/.*)?"

restorecon -Rv /opt/myapp/

ls -lZ /opt/myapp/bin/myapp
ls -lZ /opt/myapp/config/
ls -lZ /opt/myapp/data/
ls -lZ /opt/myapp/logs/

# ===============================
# Policy Testing
# ===============================

/opt/myapp/bin/myapp
ausearch -m AVC -ts recent | grep myapp || echo "No denials found"

cat /opt/myapp/logs/app.log

echo "New data entry" >> /opt/myapp/data/newfile.txt
ls -lZ /opt/myapp/data/

for i in {1..3}; do
  echo "Test run $i"
  /opt/myapp/bin/myapp
  sleep 1
done

tail -15 /opt/myapp/logs/app.log

ausearch -m AVC -ts recent
ausearch -m AVC -ts recent | audit2allow

semodule -l | grep myapp

echo "Final test data" > /opt/myapp/data/final_test.txt
/opt/myapp/bin/myapp
ausearch -m AVC -ts recent | grep myapp || echo "Policy working correctly - no denials"

# ===============================
# Advanced SELinux Management
# ===============================

getsebool -a | head -5
getsebool httpd_can_network_connect
setsebool httpd_can_network_connect on
setsebool -P httpd_can_network_connect on
semanage boolean -l | grep httpd | head -3

semanage port -l | grep http | head -3
semanage port -a -t http_port_t -p tcp 8080
semanage port -l | grep 8080

# ===============================
# Troubleshooting & Verification
# ===============================

semanage fcontext -l | grep myapp
restorecon -RvF /opt/myapp/
ls -lZ /opt/myapp/bin/myapp

semodule -l | grep -E "(myapp|custom)"

ausearch -m AVC -ts today | grep denied
systemctl status setroubleshoot

echo "=== SELinux Status Verification ==="
sestatus

echo "=== Custom Policy Verification ==="
semodule -l | grep -E "(myapp|custom)"

echo "=== File Context Verification ==="
ls -lZ /opt/myapp/bin/myapp

echo "=== Application Test ==="
/opt/myapp/bin/myapp
echo "Exit code: $?"

echo "=== Denial Check ==="
ausearch -m AVC -ts recent | grep -E "(myapp|webtest)" || echo "No recent denials found"

echo "=== Log File Verification ==="
tail -3 /opt/myapp/logs/app.log

# ===============================
# Additional Troubleshooting Commands
# ===============================

sudo iptables -I INPUT 1 -p tcp --dport 22 -j ACCEPT
sudo iptables -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

sudo ausearch -m AVC -ts recent
sudo setenforce 0
sudo setenforce 1

sudo aa-complain /usr/local/bin/testapp
sudo aa-enforce /usr/local/bin/testapp
sudo aa-disable /usr/local/bin/testapp
