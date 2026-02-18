#!/bin/bash
# ==========================================
# Lab 06 – SELinux Commands
# Environment: CentOS 7
# ==========================================

# Check OS
cat /etc/os-release

# ------------------------------------------
# 1. Check SELinux Status
# ------------------------------------------
getenforce
sestatus
cat /etc/selinux/config

# ------------------------------------------
# 2. Change Enforcement Modes
# ------------------------------------------
sudo setenforce 0
getenforce

sudo setenforce 1
getenforce

# ------------------------------------------
# 3. View Security Contexts
# ------------------------------------------
ls -Z /etc/passwd
ls -Z /var/www/html/
ps -eZ | grep sshd
id -Z

# ------------------------------------------
# 4. Context Management
# ------------------------------------------
sudo mkdir /test-selinux
sudo touch /test-selinux/testfile.txt
ls -Z /test-selinux/

sudo chcon -t httpd_exec_t /test-selinux/testfile.txt
ls -Z /test-selinux/

sudo restorecon -R /test-selinux/
ls -Z /test-selinux/

# ------------------------------------------
# 5. SELinux Booleans
# ------------------------------------------
getsebool -a | head -20
getsebool httpd_can_network_connect

sudo setsebool httpd_can_network_connect on
getsebool httpd_can_network_connect

sudo setsebool -P httpd_can_network_connect on

# ------------------------------------------
# 6. Denial Scenario (Apache)
# ------------------------------------------
sudo mkdir /custom-web
sudo touch /custom-web/index.html
sudo chown -R apache:apache /custom-web/
ls -Z /custom-web/

sudo systemctl restart httpd
curl http://localhost/custom/

# ------------------------------------------
# 7. Analyze Denial
# ------------------------------------------
sudo ausearch -m AVC -ts recent
sudo sealert -a /var/log/audit/audit.log

# ------------------------------------------
# 8. Fix Context Properly
# ------------------------------------------
sudo semanage fcontext -a -t httpd_sys_content_t "/custom-web(/.*)?"
sudo restorecon -R /custom-web/
ls -Z /custom-web/

curl http://localhost/custom/
