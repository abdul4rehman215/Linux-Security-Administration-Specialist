# 🛠 Troubleshooting Guide - Lab 12: SSH Security and Key Management

---

## 🚨 Issue 1: Permission Denied (publickey)

### 🔍 Symptoms

- Error:
  `
  Permission denied (publickey).
  `
- SSH login fails even though key exists
- Key-based authentication not working

---

### ✅ Solution

#### 1️⃣ Check SSH Directory Permissions
```bash
ls -la ~/.ssh/
```

#### 2️⃣ Fix Required Permissions
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/authorized_keys
```

---

### 📝 Root Cause

SSH refuses authentication if:
- Directory permissions are too open
- Private key is readable by others
- authorized_keys has incorrect ownership

SSH is strict about file security for protection.

---

## 🚨 Issue 2: SSH Agent Not Working

### 🔍 Symptoms

- Passphrase requested repeatedly
- `ssh-add -l` shows no identities
- `$SSH_AGENT_PID` not set

---

### ✅ Solution

#### Kill Existing Agents
```bash
pkill ssh-agent
```

#### Start New Agent
```bash
eval "$(ssh-agent -s)"
```

#### Add Key
```bash
ssh-add ~/.ssh/id_rsa
```

#### Verify
```bash
ssh-add -l
```

---

### 📝 Root Cause

- ssh-agent not running
- Session restarted
- Environment variables lost
- Agent process terminated

---

## 🚨 Issue 3: Connection Refused on New Port

### 🔍 Symptoms

- `ssh: connect to host localhost port 2222: Connection refused`
- SSH not listening on custom port

---

### ✅ Solution

#### 1️⃣ Verify SSH Listening Port
```bash
sudo netstat -tlnp | grep :2222
```

or

```bash
sudo ss -tlnp | grep :2222
```

#### 2️⃣ Check Firewall Rules
```bash
sudo ufw status
sudo ufw allow 2222/tcp
```

#### 3️⃣ Restart SSH Service
```bash
sudo systemctl restart ssh
```

---

### 📝 Root Cause

- SSH service not restarted
- Firewall blocking new port
- Typo in sshd_config
- Incorrect Port directive placement

---

## 🚨 Issue 4: Configuration Syntax Errors

### 🔍 Symptoms

- SSH fails to restart
- Systemctl shows failure
- Connection lost after configuration change

---

### ✅ Solution

#### Validate Configuration Before Restart
```bash
sudo sshd -t
```

#### Restore Backup If Necessary
```bash
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config
sudo systemctl restart ssh
```

---

### 📝 Root Cause

- Invalid directive syntax
- Duplicate configuration entries
- Incorrect indentation or format
- Unsupported configuration options

---

## 🚨 Issue 5: Root Still Able to Login

### 🔍 Symptoms

- Root login succeeds after hardening
- Configuration changes appear ignored

---

### ✅ Solution

Verify effective configuration:
```bash
sudo sshd -T | grep permitrootlogin
```

Ensure:
```
PermitRootLogin no
```

Restart service after modification:
```bash
sudo systemctl restart ssh
```

---

### 📝 Root Cause

- Configuration file not saved
- Service not restarted
- Configuration overridden by included file
- Multiple sshd_config files present

---

## 🚨 Issue 6: Too Many Authentication Attempts

### 🔍 Symptoms

- Error:
  `
  Received disconnect: Too many authentication failures
  `

---

### ✅ Solution

Reduce identities used:

```bash
ssh-add -D
ssh-add ~/.ssh/id_rsa
```

Or specify identity explicitly:
```bash
ssh -i ~/.ssh/id_rsa user@host
```

---

### 📝 Root Cause

SSH tries multiple keys automatically, exceeding `MaxAuthTries`.

---

## 🔐 SSH Security Best Practice Checklist

✔ Use key-based authentication only  
✔ Disable root login  
✔ Disable password authentication  
✔ Change default SSH port  
✔ Restrict users with `AllowUsers`  
✔ Limit authentication attempts  
✔ Use strong key passphrases  
✔ Use ssh-agent securely  
✔ Monitor SSH logs regularly  
✔ Keep SSH software updated  

---

# ✅ Final Notes

SSH security requires:

- Strict file permission management
- Proper configuration validation
- Controlled user access
- Secure key lifecycle handling
- Continuous monitoring

This lab demonstrated practical SSH hardening techniques applicable to production Linux environments.
