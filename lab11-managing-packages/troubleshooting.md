# 🛠 Troubleshooting Guide - Lab 11: Managing Packages with APT / YUM (DNF)

---

## 🚨 Issue 1: Package Manager Lock Error

### 🔍 Symptoms

- Error indicating dpkg or yum is locked
- Message such as:
  - `Could not get lock /var/lib/dpkg/lock-frontend`
  - `Another process is using yum`
- Update or install command fails immediately

---

### 🟢 APT Systems (Ubuntu/Debian)

#### Step 1: Remove Lock Files
```bash
sudo rm -f /var/lib/dpkg/lock-frontend
sudo rm -f /var/lib/dpkg/lock
```

#### Step 2: Reconfigure Packages
```bash
sudo dpkg --configure -a
```

#### Step 3: Retry Update
```bash
sudo apt update
```

---

### 🔵 YUM / DNF Systems (CentOS / RHEL)

#### Remove Lock File
```bash
sudo rm -f /var/run/yum.pid
```

#### Clean Cache
```bash
sudo dnf clean all
```

---

### 📝 Root Cause

Lock errors occur when:
- Another package process is running
- An update was interrupted
- A previous installation failed
- System reboot occurred during update

---

## 🌐 Issue 2: Repository Connection Failures

### 🔍 Symptoms

- Cannot fetch repository metadata
- `Failed to fetch`
- `Temporary failure resolving`
- Repository unreachable

---

### Step 1: Verify Internet Connectivity
```bash
ping -c 3 8.8.8.8
```

If no response, check:
- Network configuration
- Cloud security groups
- Firewall rules
- DNS resolution

---

### Step 2: Clear Cache and Retry

#### APT
```bash
sudo apt clean
sudo apt update
```

#### DNF
```bash
sudo dnf clean all
sudo dnf update
```

---

### Step 3: Validate Repository Configuration

- Check `/etc/apt/sources.list`
- Check `/etc/apt/sources.list.d/`
- Check `/etc/yum.repos.d/`
- Verify correct URLs
- Confirm GPG key validity

---

## ⚠️ Issue 3: Dependency Conflicts

### 🔍 Symptoms

- Package installation fails due to dependency issues
- Error: “Broken packages”
- Version conflicts reported

---

### 🟢 APT Fix

#### Fix Broken Dependencies
```bash
sudo apt --fix-broken install
```

#### Reinstall Package
```bash
sudo apt install --reinstall <package>
```

---

### 🔵 DNF Fix

#### Check Dependencies
```bash
dnf deplist <package-name>
```

#### Reinstall Package
```bash
sudo dnf reinstall <package>
```

---

### 📝 Root Cause

- Partial updates
- Mixing repositories
- Third-party repository conflicts
- Version mismatches
- Interrupted installation

---

## 💾 Issue 4: Disk Space Problems

### 🔍 Symptoms

- `No space left on device`
- Package installation fails
- Upgrade process stops midway

---

### Step 1: Check Disk Usage
```bash
df -h
```

---

### Step 2: Clean Package Cache

#### APT
```bash
sudo apt clean
```

#### DNF
```bash
sudo dnf clean all
```

---

### Step 3: Remove Unused Packages

#### APT
```bash
sudo apt autoremove
```

#### DNF
```bash
sudo dnf autoremove
```

---

## 🔐 Issue 5: Repository GPG Key Errors

### 🔍 Symptoms

- GPG key verification failure
- Repository not signed error
- `NO_PUBKEY` error

---

### Solution (APT Modern Method)

- Download repository key
- Convert using `gpg --dearmor`
- Store in `/usr/share/keyrings/`
- Reference using `signed-by=` option

Example:
```bash
wget -qO - <repo-url> | gpg --dearmor | sudo tee /usr/share/keyrings/repo-key.gpg > /dev/null
```

---

## 🔄 Issue 6: Script Execution Permission Error

### 🔍 Symptoms

- `Permission denied` when running script

---

### Solution
```bash
chmod +x script_name.sh
```

---

## 🧾 Issue 7: Log File Permission Error

### 🔍 Symptoms

- Cannot write to `/var/log/auto_update.log`

---

### Solution

Run script with sudo:
```bash
sudo ./auto_update.sh
```

Or verify directory permissions:
```bash
ls -ld /var/log
```

---

# ✅ Final Notes

Proper package management troubleshooting requires:

- Understanding of package database states
- Awareness of repository configuration
- Knowledge of dependency resolution
- Regular cache cleanup
- Proper logging and monitoring

This lab demonstrated real-world package lifecycle troubleshooting scenarios applicable in enterprise Linux environments.
