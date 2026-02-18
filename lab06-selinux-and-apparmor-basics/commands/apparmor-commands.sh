#!/bin/bash
# ==========================================
# Lab 06 – AppArmor Commands
# Environment: Ubuntu 24.04
# Purpose: Manual command execution reference
# ==========================================

# Check OS
cat /etc/os-release

# ------------------------------------------
# 1. Install AppArmor Tools
# ------------------------------------------
sudo apt update
sudo apt install apparmor-utils apparmor-profiles -y

# ------------------------------------------
# 2. Check Status
# ------------------------------------------
sudo apparmor_status
sudo aa-status

# ------------------------------------------
# 3. Profile Modes
# ------------------------------------------
sudo aa-complain /usr/bin/ping
sudo aa-status | grep ping

sudo aa-enforce /usr/bin/ping

# ------------------------------------------
# 4. Create Test Application
# ------------------------------------------
sudo nano /usr/local/bin/test-app.sh
sudo chmod +x /usr/local/bin/test-app.sh

/usr/local/bin/test-app.sh

# ------------------------------------------
# 5. Generate Profile
# ------------------------------------------
sudo aa-genprof /usr/local/bin/test-app.sh

# ------------------------------------------
# 6. Reload Profile
# ------------------------------------------
sudo apparmor_parser -r /etc/apparmor.d/usr.local.bin.test-app.sh

# ------------------------------------------
# 7. Test Denial
# ------------------------------------------
/usr/local/bin/test-app.sh

# ------------------------------------------
# 8. Log Analysis
# ------------------------------------------
sudo dmesg | grep -i apparmor | tail -10
sudo journalctl | grep -i apparmor | tail -5

# ------------------------------------------
# 9. Profile Tuning
# ------------------------------------------
sudo aa-logprof
