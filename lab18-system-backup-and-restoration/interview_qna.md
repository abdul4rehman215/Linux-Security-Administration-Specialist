# 🎤 Interview Q&A - Lab 18: System Backup and Restoration

---

## 1️⃣ What is rsync and why is it preferred for backups?

`rsync` is a fast, versatile file-copying tool that synchronizes files and directories efficiently.  
It transfers only the differences between source and destination, making it ideal for incremental backups.

---

## 2️⃣ What does the `-a` option in rsync do?

`-a` stands for **archive mode**. It preserves:

- File permissions
- Ownership
- Timestamps
- Symbolic links
- Recursive directory structure

It is equivalent to:
```
-rlptgoD
```

---

## 3️⃣ Explain the purpose of `--delete` in rsync.

`--delete` removes files in the destination that no longer exist in the source.

This ensures the backup remains an exact mirror of the original system.

⚠ Use carefully in production environments.

---

## 4️⃣ What is an incremental backup?

An incremental backup stores only files that have changed since the last backup.

In this lab, incremental backup was implemented using:

```
--link-dest
```

This creates hard links for unchanged files, saving storage space.

---

## 5️⃣ What is the advantage of using hard links in backups?

Hard links:

- Do not duplicate file data
- Save disk space
- Allow multiple snapshots
- Improve storage efficiency

Common in enterprise backup strategies.

---

## 6️⃣ How do cron jobs help automate backups?

Cron allows scheduled execution of commands.

Example:
```
0 2 * * * /home/toor/system_backup.sh
```

This runs daily at 2:00 AM.

Automation ensures:

- Regular backups
- Reduced human error
- Compliance with backup policies

---

## 7️⃣ What is the difference between daily incremental and weekly full backup?

Daily incremental:
- Faster
- Smaller size
- Captures recent changes

Weekly full:
- Complete system snapshot
- Compressed archive
- Used for long-term retention

---

## 8️⃣ How do you verify backup integrity?

Methods used in this lab:

- File count comparison
- File content comparison using `cmp`
- Permission verification using `stat`
- Checksum validation using `md5sum`

Checksum example:
```
md5sum -c backup_checksums.md5
```

---

## 9️⃣ Why is restoration testing critical?

A backup without restoration testing is unreliable.

Restoration testing ensures:

- Files can be recovered
- Permissions remain intact
- Data integrity is preserved
- Disaster recovery plan works

---

## 🔟 What risks exist if backups are not verified?

- Silent corruption
- Incomplete data
- Broken permissions
- Missing critical files
- Failed disaster recovery

Verification scripts reduce these risks.

---

## 1️⃣1️⃣ What is the purpose of pre-restoration backup?

Before restoration, a snapshot of the current state is created:

```
pre_restore_backup_YYYYMMDD
```

This protects against accidental overwrite and allows rollback.

---

## 1️⃣2️⃣ How can insufficient disk space impact backup systems?

Effects:

- Backup failure
- Partial backup
- Corrupted archives
- Cron job errors

Monitoring disk space using:
```
df -h
du -sh
```
is essential.

---

## 1️⃣3️⃣ How does `rsync` handle permissions during restore?

Using `-a`, rsync preserves:

- File mode (755, 644, etc.)
- Ownership
- Timestamps

This ensures restored system behaves exactly like original.

---

## 1️⃣4️⃣ What is selective restoration?

Selective restoration allows recovery of specific files instead of full system restore.

Benefits:

- Faster recovery
- Less disruption
- Minimal downtime

Implemented in this lab via interactive restore script.

---

## 1️⃣5️⃣ How would you secure a backup system in production?

Best practices:

- Encrypt backups
- Restrict access permissions
- Store offsite backups
- Use immutable storage
- Monitor backup logs
- Implement retention policy
- Use checksums and validation scripts

---

# ✅ Summary

This lab demonstrates real-world backup architecture including:

- Incremental and full backups
- Automation with cron
- Disaster simulation
- Restoration procedures
- Integrity validation
- Permission preservation

These concepts are critical for:

- Linux System Administration
- DevOps
- Cloud Engineering
- Disaster Recovery Planning
- Security Operations

