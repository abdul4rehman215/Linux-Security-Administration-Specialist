#!/bin/bash
# ==========================================
# Lab 06 – SELinux Full Execution Script
# Environment: CentOS 7
# ==========================================

echo "===== SELinux Lab Execution Started ====="

echo "[1] Checking SELinux status..."
getenforce
sestatus

echo "[2] Switching to permissive mode..."
sudo setenforce 0
getenforce

echo "[3] Switching back to enforcing mode..."
sudo setenforce 1
getenforce

echo "[4] Viewing SELinux configuration file..."
cat /etc/selinux/config

echo "[5] Viewing file and process contexts..."
ls -Z /etc/passwd
ps -eZ | grep sshd

echo "[6] Creating test directory..."
sudo mkdir -p /test-selinux
sudo touch /test-selinux/testfile.txt
ls -Z /test-selinux/

echo "[7] Changing file context temporarily..."
sudo chcon -t httpd_exec_t /test-selinux/testfile.txt
ls -Z /test-selinux/

echo "[8] Restoring default context..."
sudo restorecon -R /test-selinux/
ls -Z /test-selinux/

echo "[9] Working with SELinux booleans..."
getsebool httpd_can_network_connect
sudo setsebool httpd_can_network_connect on
sudo setsebool -P httpd_can_network_connect on
getsebool httpd_can_network_connect

echo "[10] Creating Apache denial scenario..."
sudo mkdir -p /custom-web
echo "Test content" | sudo tee /custom-web/index.html
sudo chown -R apache:apache /custom-web/
ls -Z /custom-web/

echo "[11] Configuring Apache alias..."
sudo bash -c 'cat > /etc/httpd/conf.d/custom.conf <<EOF
<Directory "/custom-web">
 AllowOverride None
 Require all granted
</Directory>

Alias /custom /custom-web
EOF'

echo "[12] Restarting Apache..."
sudo systemctl restart httpd

echo "[13] Testing access (should fail)..."
curl http://localhost/custom/

echo "[14] Checking AVC denial..."
sudo ausearch -m AVC -ts recent

echo "[15] Fixing context properly..."
sudo semanage fcontext -a -t httpd_sys_content_t "/custom-web(/.*)?"
sudo restorecon -R /custom-web/
ls -Z /custom-web/

echo "[16] Retesting access (should succeed)..."
curl http://localhost/custom/

echo "===== SELinux Lab Execution Completed ====="
