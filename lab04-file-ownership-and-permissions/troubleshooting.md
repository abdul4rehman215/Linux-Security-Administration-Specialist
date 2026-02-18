# 🛠 Troubleshooting Guide - Lab 04: File Ownership and Permissions

---

# 🔐 Issue 1: Permission Denied When Executing Script

## ❌ Problem
`
bash: ./test_script.sh: Permission denied
`

## 🔎 Cause
Execute permission not set.

## ✅ Solution
```
chmod +x test_script.sh
```

Verify:
```
ls -l test_script.sh
```

---

# 📂 Issue 2: Cannot Access Directory

## ❌ Problem
`
cd directory: Permission denied
`

## 🔎 Cause
Execute (x) permission missing on directory.

## ✅ Solution
```
chmod +x directory_name
```

Remember:
- Directories require execute permission to enter.

---

# 👥 Issue 3: Group Changes Not Reflecting

## ❌ Problem
User added to group but permissions not working.

## 🔎 Cause
User session not refreshed.

## ✅ Solution

Logout and login again.

Or use:
```
newgrp groupname
```

Verify:
```
groups
```

---

# 🧮 Issue 4: Incorrect Permission After umask Change

## ❌ Problem
New files not getting expected permissions.

## 🔎 Cause
Wrong umask calculation.

## ✅ Solution

Check current umask:
```
umask
```

Remember formula:

Files: 666 - umask  
Directories: 777 - umask  

---

# 🔒 Issue 5: ACL Not Working

## ❌ Problem
setfacl command not found.

## 🔎 Cause
ACL package not installed.

## ✅ Solution
```
sudo apt install acl
```

Verify:
```
getfacl --version
```

---

# 🛡 Issue 6: ACL Permissions Not Effective

## ❌ Problem
ACL shows rwx but user cannot write.

## 🔎 Cause
ACL mask restricting effective permissions.

## ✅ Solution
Check mask:
```
getfacl filename
```

Modify mask:
```
setfacl -m m:rwx filename
```

---

# 🔁 Issue 7: Recursive chmod Broke File Access

## ❌ Problem
chmod -R applied incorrectly and removed needed permissions.

## 🔎 Cause
Using numeric mode blindly on mixed file types.

## ✅ Solution
Use separate commands:

Directories:
```
find directory -type d -exec chmod 755 {} \;
```

Files:
```
find directory -type f -exec chmod 644 {} \;
```

---

# 📛 Issue 8: Cannot Delete File in Shared Directory

## ❌ Problem
File deletion denied in shared folder.

## 🔎 Cause
Sticky bit enabled.

Sticky bit allows only file owner to delete their files.

## ✅ Explanation
Sticky bit is expected behavior in secure shared directories.

Check:
```
ls -ld directory
```

Look for `t` at end.

---

# 🔎 Issue 9: SGID Not Working

## ❌ Problem
New files not inheriting group.

## 🔎 Cause
SGID not set properly.

## ✅ Solution
```
chmod g+s directory
```

Verify:
```
ls -ld directory
```

Look for `s` in group execute position.

---

# 📊 Issue 10: Files Showing Unknown User/Group

## ❌ Problem
Files show numeric UID/GID.

## 🔎 Cause
User or group deleted but files remain.

## ✅ Solution

Find orphaned files:
```
find / -nouser -o -nogroup
```

Fix ownership:
```
sudo chown user:group filename
```

---

# ⚠ Issue 11: 777 Permissions in Production

## ❌ Problem
Files accidentally set to 777.

## 🔎 Risk
- Anyone can modify
- Web shell injection risk
- Privilege escalation vulnerability

## ✅ Solution
Reset to secure permission:
```
chmod 644 file
chmod 755 directory
```

Audit system:
```
find / -perm 777 2>/dev/null
```

---

# 🔍 Issue 12: SUID/SGID Security Risk

## ❌ Problem
Unexpected SUID binaries found.

## 🔎 Risk
Potential privilege escalation.

## ✅ Audit:
```
find / -perm /4000 2>/dev/null
```

Remove if unnecessary:
```
chmod u-s binary
```

---

# 🧪 Debugging Checklist

Before finishing lab:

- [ ] No unnecessary 777 permissions  
- [ ] No orphaned files  
- [ ] SGID set correctly for shared dirs  
- [ ] Sticky bit functioning  
- [ ] ACL masks verified  
- [ ] umask calculation validated  

---

# 🛡 Security Best Practices

✔ Follow Principle of Least Privilege  
✔ Avoid 777 in production  
✔ Use groups instead of individual access  
✔ Use ACL only when necessary  
✔ Audit special bits regularly  
✔ Secure configuration directories (700/600)  

---

# 🎯 Final Note

Misconfigured permissions are one of the most common root causes of:

- Web server compromises
- Data breaches
- Insider data leaks
- Privilege escalation attacks

Mastering file ownership and permissions is essential for:

- Linux System Administrators  
- SOC Engineers  
- DevOps Engineers  
- Cloud Security Professionals  

---

## ✅ Lab 04 Troubleshooting Complete
