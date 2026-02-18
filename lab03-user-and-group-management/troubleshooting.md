# 🛠 Troubleshooting Guide - Lab 03: User and Group Management

---

# 🔐 Issue 1: Permission Denied When Creating Users

## ❌ Problem
```
useradd: Permission denied.
```

## 🔎 Cause
User does not have administrative privileges.

## ✅ Solution
Use sudo:

```
sudo useradd username
```

Verify sudo access:

```
groups
```

Ensure user is part of `sudo` group.

---

# 👤 Issue 2: User Already Exists

## ❌ Problem
```
useradd: user 'username' already exists
```

## 🔎 Cause
User already exists in `/etc/passwd`.

## ✅ Solution
Verify existing user:

```
grep username /etc/passwd
```

Choose a different username or delete existing user:

```
sudo userdel username
```

---

# 🏠 Issue 3: Home Directory Not Created

## ❌ Problem
User created but no `/home/username` directory.

## 🔎 Cause
`-m` option not used during `useradd`.

## ✅ Solution
Create user properly:

```
sudo useradd -m username
```

Or manually create:

```
sudo mkdir /home/username
sudo chown username:username /home/username
```

---

# 🔄 Issue 4: Cannot Delete Group

## ❌ Problem
```
groupdel: cannot remove the primary group of user
```

## 🔎 Cause
Group is assigned as primary group to a user.

## ✅ Solution
Change primary group first:

```
sudo usermod -g users username
sudo groupdel groupname
```

---

# 🔐 Issue 5: User Cannot Log In After Locking

## ❌ Problem
User login fails.

## 🔎 Cause
Account locked using:

```
sudo usermod -L username
```

## ✅ Solution
Unlock account:

```
sudo usermod -U username
```

Verify status:

```
sudo passwd -S username
```

---

# 🧮 Issue 6: Duplicate UID Detected

## ❌ Problem
Multiple users share same UID.

## 🔎 Cause
Manual UID assignment conflict.

## ✅ Solution
Find duplicates:

```
cut -d: -f3 /etc/passwd | sort | uniq -d
```

Fix UID:

```
sudo usermod -u newUID username
```

Ensure file ownership consistency:

```
sudo find / -uid oldUID -exec chown -h username {} \;
```

---

# ⏳ Issue 7: Password Expiration Not Working

## ❌ Problem
User password does not expire as expected.

## 🔎 Cause
Password aging not configured properly.

## ✅ Solution
Check settings:

```
sudo chage -l username
```

Set policy:

```
sudo chage -M 90 -m 7 -W 14 username
```

---

# 📛 Issue 8: Cannot Remove User

## ❌ Problem
```
userdel: user is currently logged in
```

## 🔎 Cause
User has active session.

## ✅ Solution
Check active sessions:

```
who
```

Force delete:

```
sudo userdel -f username
```

Or terminate session:

```
sudo pkill -u username
```

---

# 🔍 Issue 9: No Output from Security Checks

## ❌ Problem
Commands like:
```
sudo awk -F: '($2 == "") {print $1}' /etc/shadow
```
Return no output.

## 🔎 Cause
System is secure — no empty passwords.

## ✅ Explanation
No output is expected when configuration is secure.

---

# 📂 Issue 10: Shared Directory Access Not Working

## ❌ Problem
User cannot write to shared directory.

## 🔎 Cause
Incorrect group ownership or permissions.

## ✅ Solution
Check ownership:

```
ls -ld /opt/projects
```

Fix:

```
sudo chgrp webdev /opt/projects
sudo chmod 775 /opt/projects
```

---

# 📊 Issue 11: Bulk Script Not Executing

## ❌ Problem
```
Permission denied
```

## 🔎 Cause
Script not executable.

## ✅ Solution
```
chmod +x create_users.sh
```

Verify:

```
ls -l create_users.sh
```

---

# 🛡 Security Best Practice Checklist

Before completing lab:

- [ ] No duplicate UID 0 users  
- [ ] No empty password accounts  
- [ ] Unused test users removed  
- [ ] Temporary groups deleted  
- [ ] Password aging enforced  
- [ ] Login shells restricted properly  
- [ ] Shared directories have correct group ownership  

---

# 🔎 Debugging Tips

### Enable verbose command output
```
sudo useradd -D
```

### Check logs for authentication errors
```
sudo tail -f /var/log/auth.log
```

### Verify account status
```
sudo passwd -S username
```

---

# 🎯 Final Note

User and group misconfigurations are among the most common causes of:

- Privilege escalation
- Unauthorized access
- Insider threats
- Compliance violations

Proper account lifecycle management is critical for maintaining Linux system security in enterprise environments.

---

## ✅ Lab 03 Troubleshooting Complete
