#!/bin/bash
# ==========================================
# Lab 06 – AppArmor Full Execution Script
# Environment: Ubuntu 24.04.1 LTS
# ==========================================

echo "===== AppArmor Lab Execution Started ====="

echo "[1] Installing AppArmor utilities..."
sudo apt update
sudo apt install -y apparmor-utils apparmor-profiles

echo "[2] Checking AppArmor status..."
sudo aa-status

echo "[3] Switching ping profile to complain mode..."
sudo aa-complain /usr/bin/ping
sudo aa-status | grep ping

echo "[4] Switching ping back to enforce mode..."
sudo aa-enforce /usr/bin/ping

echo "[5] Creating test application..."
sudo bash -c 'cat > /usr/local/bin/test-app.sh <<EOF
#!/bin/bash
echo "Test application starting..."
whoami
date
ls /home/
echo "Attempting restricted access..."
cat /etc/shadow
cat /etc/passwd
echo "Test application finished."
EOF'

sudo chmod +x /usr/local/bin/test-app.sh

echo "[6] Running test application (before profile)..."
/usr/local/bin/test-app.sh

echo "[7] Generating AppArmor profile..."
sudo aa-genprof /usr/local/bin/test-app.sh

echo ">> Follow interactive prompts and allow required binaries."

echo "[8] Reloading profile..."
sudo apparmor_parser -r /etc/apparmor.d/usr.local.bin.test-app.sh

echo "[9] Running test application with profile enforced..."
/usr/local/bin/test-app.sh

echo "[10] Checking AppArmor denial logs..."
sudo dmesg | grep -i apparmor | tail -5
sudo journalctl | grep -i apparmor | tail -5

echo "[11] Performance test script creation..."
sudo bash -c 'cat > /usr/local/bin/perf-test.sh <<EOF
#!/bin/bash
echo "Starting performance test..."
time for i in {1..1000}; do
 ls /etc/ > /dev/null 2>&1
done
echo "Performance test completed."
EOF'

sudo chmod +x /usr/local/bin/perf-test.sh

echo "[12] Running performance test..."
/usr/local/bin/perf-test.sh

echo "===== AppArmor Lab Execution Completed ====="
