# ============================
# Environment Verification
# ============================

cat /etc/os-release
ip addr show
ip addr show | grep inet
ss -tuln
sudo iptables -L -v -n
systemctl list-units --type=service --state=running | head -5


# ============================
# iptables Configuration
# ============================

sudo nano /etc/iptables-security.sh
sudo chmod +x /etc/iptables-security.sh
sudo /etc/iptables-security.sh
sudo iptables -L -v -n

sudo apt update
sudo apt install -y iptables-persistent
sudo iptables-save > /etc/iptables/rules.v4


# ============================
# nftables Configuration
# ============================

sudo apt install -y nftables
sudo nano /etc/nftables-security.conf
sudo nft -f /etc/nftables-security.conf
sudo nft list ruleset
sudo systemctl enable nftables
sudo systemctl start nftables


# ============================
# SELinux Configuration (Ubuntu)
# ============================

sestatus
sudo apt install -y selinux-utils selinux-basics policycoreutils
sudo selinux-activate
getenforce
sudo setenforce 1
getenforce
ls -Z /etc/passwd
ps -eZ | head -5

mkdir ~/selinux-policy
cd ~/selinux-policy
nano myapp.te
sudo apt install -y policycoreutils-dev
make -f /usr/share/selinux/devel/Makefile myapp.pp
sudo semodule -i myapp.pp
semodule -l | grep myapp


# ============================
# AppArmor Configuration
# ============================

sudo apparmor_status
sudo apt install -y apparmor-utils
sudo aa-status | head -5

sudo nano /usr/local/bin/testapp
sudo chmod +x /usr/local/bin/testapp
sudo aa-genprof /usr/local/bin/testapp
sudo nano /etc/apparmor.d/usr.local.bin.testapp
sudo apparmor_parser -r /etc/apparmor.d/usr.local.bin.testapp
sudo aa-status | grep testapp
/usr/local/bin/testapp


# ============================
# Security Context Manager
# ============================

sudo nano /usr/local/bin/security-context-manager.sh
sudo chmod +x /usr/local/bin/security-context-manager.sh
sudo /usr/local/bin/security-context-manager.sh


# ============================
# Vulnerability Assessment
# ============================

nano ~/vulnerability-assessment.sh
chmod +x ~/vulnerability-assessment.sh
./vulnerability-assessment.sh
head -30 vulnerability_report_*.txt


# ============================
# Network Security Scan
# ============================

sudo apt install -y nmap netcat-openbsd
nano ~/network-security-scan.sh
chmod +x ~/network-security-scan.sh
./network-security-scan.sh
head -40 network_scan_*.txt


# ============================
# Security Log Analysis
# ============================

nano ~/security-log-analysis.sh
chmod +x ~/security-log-analysis.sh
./security-log-analysis.sh
head -30 security_log_analysis_*.txt


# ============================
# Comprehensive Security Assessment
# ============================

nano ~/comprehensive-security-assessment.sh
chmod +x ~/comprehensive-security-assessment.sh
./comprehensive-security-assessment.sh
head -20 comprehensive_security_report_*.txt


# ============================
# Security Verification Tests
# ============================

ssh localhost -p 22
curl -I http://localhost
nc -zv localhost 21

/usr/local/bin/testapp
echo "test" > /etc/test-file

sudo tail -f /var/log/auth.log &
sudo tail -f /var/log/syslog | grep IPTABLES-DROPPED &


# ============================
# Troubleshooting Commands
# ============================

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
