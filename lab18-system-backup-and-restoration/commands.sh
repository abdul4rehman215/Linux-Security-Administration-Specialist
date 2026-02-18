#!/bin/bash

# ==========================================
# Lab 18 – System Backup and Restoration
# Commands Executed
# ==========================================


# ------------------------------
# Environment Verification
# ------------------------------

cat /etc/os-release
pwd


# ------------------------------
# Check rsync Installation
# ------------------------------

rsync --version


# ------------------------------
# Create Sample Data
# ------------------------------

mkdir -p /home/toor/important_data
cd /home/toor/important_data

echo "This is document 1" > document1.txt
echo "This is document 2" > document2.txt
echo "Configuration data" > config.conf

mkdir subdirectory
echo "Nested file content" > subdirectory/nested_file.txt

dd if=/dev/zero of=largefile.dat bs=1M count=10

chmod 755 document1.txt
chmod 644 document2.txt
chmod 600 config.conf

ls -la
ls -la subdirectory/


# ------------------------------
# Basic Backup
# ------------------------------

mkdir -p /home/toor/backups

rsync -av /home/toor/important_data/ /home/toor/backups/basic_backup/
ls -la /home/toor/backups/basic_backup/


# ------------------------------
# Advanced Backup
# ------------------------------

rsync -avz --progress --stats /home/toor/important_data/ /home/toor/backups/advanced_backup/


# ------------------------------
# Incremental Backup with Hard Links
# ------------------------------

rsync -av --link-dest=/home/toor/backups/advanced_backup \
/home/toor/important_data/ \
/home/toor/backups/incremental_backup/


# ------------------------------
# Backup with Exclusions
# ------------------------------

rsync -av --exclude='*.tmp' --exclude='*.log' \
/home/toor/important_data/ \
/home/toor/backups/filtered_backup/


# ------------------------------
# Create Backup Script
# ------------------------------

nano /home/toor/system_backup.sh
chmod +x /home/toor/system_backup.sh
./system_backup.sh

cat /home/toor/backups/backup.log


# ------------------------------
# Cron Setup
# ------------------------------

crontab -e
crontab -l

systemctl status cron
grep CRON /var/log/syslog | tail -10


# ------------------------------
# Weekly Backup Script
# ------------------------------

nano /home/toor/weekly_backup.sh
chmod +x /home/toor/weekly_backup.sh


# ------------------------------
# Backup Verification Script
# ------------------------------

nano /home/toor/verify_backup.sh
chmod +x /home/toor/verify_backup.sh
./verify_backup.sh
cat /home/toor/backups/verification.log


# ------------------------------
# Simulate Disaster
# ------------------------------

rsync -av /home/toor/important_data/ /home/toor/backups/pre_disaster_backup/

rm -f /home/toor/important_data/document1.txt
rm -f /home/toor/important_data/document2.txt
echo "corrupted data" > /home/toor/important_data/config.conf
rm -rf /home/toor/important_data/subdirectory

ls -la /home/toor/important_data/
cat /home/toor/important_data/config.conf


# ------------------------------
# Restore Individual Files
# ------------------------------

rsync -av /home/toor/backups/system_backup/important_data/document1.txt /home/toor/important_data/
rsync -av /home/toor/backups/system_backup/important_data/document2.txt /home/toor/important_data/

rsync -av /home/toor/backups/system_backup/important_data/subdirectory/ \
/home/toor/important_data/subdirectory/

ls -la /home/toor/important_data/
ls -la /home/toor/important_data/subdirectory/


# ------------------------------
# Full Directory Restore
# ------------------------------

rm -rf /home/toor/important_data

rsync -av /home/toor/backups/system_backup/important_data/ \
/home/toor/important_data/

ls -la /home/toor/important_data/
cat /home/toor/important_data/config.conf
cat /home/toor/important_data/subdirectory/nested_file.txt


# ------------------------------
# Restoration Script
# ------------------------------

nano /home/toor/restore_system.sh
chmod +x /home/toor/restore_system.sh
./restore_system.sh


# ------------------------------
# Selective Restore Script
# ------------------------------

nano /home/toor/selective_restore.sh
chmod +x /home/toor/selective_restore.sh
./selective_restore.sh


# ------------------------------
# Restoration Verification Script
# ------------------------------

nano /home/toor/verify_restoration.sh
chmod +x /home/toor/verify_restoration.sh
./verify_restoration.sh

cat /home/toor/backups/restoration_verification.log


# ------------------------------
# Disk Space & Integrity Checks
# ------------------------------

df -h
du -sh /home/toor/backups/

find /home/toor/backups/ -name "*.tar.gz" -mtime +30 -delete

find /home/toor/backups/system_backup -type f -exec md5sum {} \; > /home/toor/backups/backup_checksums.md5

cd /home/toor/backups
md5sum -c backup_checksums.md5
