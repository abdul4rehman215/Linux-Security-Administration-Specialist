# 🎤 Interview Questions & Answers - Lab 04: File Ownership and Permissions

---

## 1️⃣ What are the three types of permissions in Linux?

Linux uses three permission types:

- **r (read)** → View file content
- **w (write)** → Modify file content
- **x (execute)** → Run file as a program

For directories:
- Read → List contents
- Write → Create/Delete files
- Execute → Enter directory

---

## 2️⃣ What is the difference between symbolic and numeric chmod?

- **Symbolic mode** → Uses letters (u, g, o, a)
  ```
  chmod u+x file.sh
  ```

- **Numeric mode** → Uses octal numbers (755, 644)
  ```
  chmod 755 file.sh
  ```

Numeric values:
- r = 4
- w = 2
- x = 1

---

## 3️⃣ What does 755 mean?

755 = rwxr-xr-x

- Owner → Full access (7)
- Group → Read & execute (5)
- Others → Read & execute (5)

Commonly used for executable scripts and directories.

---

## 4️⃣ What does 600 mean and where is it used?

600 = rw-------

Only owner can read/write.

Used for:
- Private keys
- Password files
- Sensitive configuration files

---

## 5️⃣ What is the purpose of chown?

`chown` changes file ownership.

Examples:
```
sudo chown user file.txt
sudo chown user:group file.txt
```

Used in:
- Web server deployments
- Application ownership control
- Secure multi-user environments

---

## 6️⃣ What is the difference between chown and chgrp?

- `chown` → Changes user and/or group
- `chgrp` → Changes only group ownership

---

## 7️⃣ How does umask work?

Umask subtracts permissions from default values:

- Files default = 666
- Directories default = 777

Example:
```
umask 022
```

666 - 022 = 644  
777 - 022 = 755  

---

## 8️⃣ What is the difference between temporary and permanent umask?

- Temporary → `umask 077`
- Permanent → Add to `~/.bashrc` or `/etc/profile`

---

## 9️⃣ What are Access Control Lists (ACLs)?

ACLs provide advanced permission control beyond standard rwx.

They allow:
- Specific user permissions
- Specific group permissions
- Default inherited permissions

Managed using:
```
setfacl
getfacl
```

---

## 🔟 What is an ACL mask?

The ACL mask defines the **maximum effective permission** for users and groups (excluding owner).

Even if ACL grants rwx, mask can restrict it.

---

## 1️⃣1️⃣ What is the Sticky Bit?

Sticky bit prevents users from deleting files they do not own inside shared directories.

Set using:
```
chmod +t directory
```

Common example:
```
/tmp
```

---

## 1️⃣2️⃣ What is SGID on directories?

SGID (Set Group ID) ensures new files inherit the parent directory’s group.

Set using:
```
chmod g+s directory
```

Used in shared project environments.

---

## 1️⃣3️⃣ Why is 777 considered dangerous?

777 = rwxrwxrwx

Everyone can:
- Modify files
- Delete content
- Execute programs

This creates:
- Privilege escalation risks
- Malware injection risk
- Data tampering

Should be avoided in production.

---

## 1️⃣4️⃣ How can you find files with special permission bits?

```
find / -perm /6000
```

Used for security auditing to detect:
- SUID binaries
- SGID binaries

These can be exploited for privilege escalation.

---

## 🛡 Why is File Permission Management Important?

Proper permission management ensures:

- Principle of Least Privilege
- Data confidentiality
- Controlled access
- Secure multi-user collaboration
- Protection against insider threats

---

# ✅ Summary

This lab demonstrates:

✔ Deep understanding of Linux permission model  
✔ Secure configuration practices  
✔ Enterprise-ready file access management  
✔ ACL implementation for granular control  
✔ Special permission bits handling  

These concepts are foundational for:

- Linux System Administration
- SOC Engineering
- DevSecOps
- Cloud Security Hardening
