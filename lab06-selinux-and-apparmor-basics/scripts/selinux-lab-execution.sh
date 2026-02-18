#!/bin/bash
# ==========================================================
# Lab 06 – SELinux Full Execution Automation Script
# Environment: CentOS 7
# Purpose: Complete automated lab execution
# ==========================================================

echo "=================================================="
echo " Starting SELinux Full Lab Execution"
echo "=================================================="

echo "[1] Checking Operating System..."
cat /etc/os-release

echo "[2] Checking SELinux Status..."
getenforce
sestatus
cat /etc/selinux/config

echo "[3] Switching SELinux to Permissive Mode..."
sudo setenforce 0
getenforce

echo "[4] Switching SELinux back to Enforcing Mode..."
sudo setenforce 1
getenforce

echo "[5] Viewing Security Contexts..."
ls -Z /etc/passwd
id -Z
ps -eZ | grep sshd

echo "[6] Creating Test Directory for Context Management..."
sudo mkdir -p /test-selinux
sudo touch /test-selinux/testfile.txt
ls -Z /test-selinux/

echo "[7] Changing Context Manually..."
sudo chcon -t httpd_exec_t /test-selinux/testfile.txt
ls -Z /test-selinux/

echo "[8] Restoring Default Context..."
sudo restorecon -R /test-selinux/
ls -Z /test-selinux/

echo "[9] Working with SELinux Booleans..."
getsebool httpd_can_network_connect
sudo setsebool httpd_can_network_connect on
sudo setsebool -P httpd_can_network_connect on
getsebool httpd_can_network_connect

echo "[10] Installing Troubleshooting Tools..."
sudo yum install -y setroubleshoot-server policycoreutils-python-utils

echo "[11] Creating Apache Denial Scenario..."
sudo mkdir -p /custom-web
echo "Test content" | sudo tee /custom-web/index.html
sudo chown -R apache:apache /custom-web/

echo "[12] Checking Incorrect Context..."
ls -Z /custom-web/

echo "[13] Configuring Apache Alias..."
sudo bash -c 'cat > /etc/httpd/conf.d/custom.conf <<EOF
<Directory "/custom-web">
 AllowOverride None
 Require all granted
</Directory>

Alias /custom /custom-web
EOF'

echo "[14] Restarting Apache..."
sudo systemctl restart httpd

echo "[15] Testing Access (Expected: Forbidden)..."
curl -I http://localhost/custom/

echo "[16] Checking AVC Denials..."
sudo ausearch -m AVC -ts recent

echo "[17] Fixing Context Properly..."
sudo semanage fcontext -a -t httpd_sys_content_t "/custom-web(/.*)?"
sudo restorecon -R /custom-web/
ls -Z /custom-web/

echo "[18] Retesting Access (Expected: Success)..."
curl http://localhost/custom/

echo "=================================================="
echo " SELinux Lab Execution Completed Successfully"
echo "=================================================="
