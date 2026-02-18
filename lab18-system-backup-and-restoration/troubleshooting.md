# 🛠 Troubleshooting Guide - Lab 18: System Backup and Restoration

---

# 📌 Issue 1: Permission Denied Errors During Backup

## 🔎 Symptoms
- rsync fails with permission denied
- Some files skipped during backup
- Incomplete backup

## ✅ Check File Permissions

```
ls -la /home/toor/important_data/
```

If needed:

```
chmod -R u+rw /home/toor/important_data/
```

For system-wide backups:

```
sudo rsync -av /etc/ /home/toor/backups/etc_backup/
```

---

# 📌 Issue 2: Backup Directory Not Found

## 🔎 Symptoms
- Script exits with error
- Backup path missing

## ✅ Verify Directory

```
ls -la /home/toor/backups/
```

Ensure script creates directory:

```
mkdir -p "$BACKUP_DEST"
```

---

# 📌 Issue 3: Insufficient Disk Space

## 🔎 Symptoms
- Backup stops mid-transfer
- rsync errors
- Compressed archive incomplete

## ✅ Check Disk Usage

```
df -h
du -sh /home/toor/backups/
```

## ✅ Cleanup Old Backups

```
find /home/toor/backups/ -name "*.tar.gz" -mtime +30 -delete
```

Implement retention policies in production.

---

# 📌 Issue 4: Cron Jobs Not Running

## 🔎 Symptoms
- Backup not executed at scheduled time
- No new logs generated

## ✅ Check Cron Service

```
systemctl status cron
```

## ✅ Verify Installed Cron Jobs

```
crontab -l
```

## ✅ Inspect Logs

```
grep CRON /var/log/syslog | tail -10
```

Common cause:
- Wrong script path
- Script not executable
- Environment variables missing

---

# 📌 Issue 5: Script Not Executable

## 🔎 Symptoms
- "Permission denied" when running script

## ✅ Fix

```
chmod +x script_name.sh
```

---

# 📌 Issue 6: Backup Corruption

## 🔎 Symptoms
- Files differ from original
- Restore produces errors

## ✅ Generate Checksums

```
find /home/toor/backups/system_backup -type f -exec md5sum {} \; > backup_checksums.md5
```

## ✅ Verify Integrity

```
md5sum -c backup_checksums.md5
```

If mismatch:
- Re-run backup
- Check disk health

---

# 📌 Issue 7: Restoration Overwrites Critical Files

## 🔎 Prevention Strategy

Always create pre-restoration backup:

```
pre_restore_backup_YYYYMMDD
```

If restore fails, revert from pre-restore snapshot.

---

# 📌 Issue 8: Permissions Not Preserved After Restore

## 🔎 Cause
- rsync missing `-a` flag

## ✅ Solution

Use:

```
rsync -av --delete source/ destination/
```

Verify permissions:

```
stat filename
```

---

# 📌 Issue 9: Incremental Backup Not Saving Space

## 🔎 Cause
- `--link-dest` not used correctly
- Incorrect base directory path

## ✅ Verify Hard Links

```
ls -li filename
```

Same inode number indicates hard link.

---

# 📌 Issue 10: Backup Script Hanging

## 🔎 Possible Causes
- Large files
- Network-mounted storage
- Disk I/O bottleneck

## ✅ Monitor System

```
top
iotop
```

Consider compression or excluding large temporary files.

---

# 📌 Issue 11: Verification Script Reporting File Mismatch

## 🔎 Cause
- File changed after backup
- Partial restore
- Permission differences

## ✅ Compare Files Manually

```
cmp file1 file2
diff file1 file2
```

---

# 🔐 Backup Best Practices

- Follow 3-2-1 Rule (3 copies, 2 media types, 1 offsite)
- Encrypt backup archives
- Restrict access permissions
- Automate verification
- Monitor logs regularly
- Test restoration periodically
- Maintain retention policy

---

# 🧠 Diagnostic Checklist

```
rsync --version
df -h
du -sh /home/toor/backups/
crontab -l
systemctl status cron
ls -la backup_directory
md5sum -c backup_checksums.md5
```

---

# ✅ Conclusion

This troubleshooting framework ensures:

- Reliable backup automation
- Safe restoration process
- Data integrity verification
- Efficient disk usage
- Cron reliability
- Production-level disaster recovery readiness

A properly monitored and tested backup system is essential for business continuity and operational resilience.
