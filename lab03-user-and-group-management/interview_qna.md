# 🎤 Interview Questions & Answers - Lab 03: User and Group Management

---

## 1️⃣ What is the purpose of `/etc/passwd`?

`/etc/passwd` stores basic user account information including:
- Username
- UID
- GID
- Home directory
- Default login shell

It does **not** store actual passwords. The password field contains `x`, indicating that the hashed password is stored securely in `/etc/shadow`.

---

## 2️⃣ What is the difference between `/etc/passwd` and `/etc/shadow`?

- `/etc/passwd` → Publicly readable account information  
- `/etc/shadow` → Secure file containing hashed passwords and password aging details  

Only root can read `/etc/shadow`.

---

## 3️⃣ What is the difference between a system user and a regular user?

- **Regular users**: UID ≥ 1000 (typically interactive login users)
- **System users**: UID < 1000 (used for services and background processes)

System users usually have `/usr/sbin/nologin` or `/bin/false` as their shell.

---

## 4️⃣ What does the `-m` option do in `useradd`?

`-m` creates a home directory for the user if it does not exist.

Example:
```
sudo useradd -m username
```

---

## 5️⃣ What is the purpose of `usermod -aG`?

`-aG` adds a user to supplementary groups **without removing existing group memberships**.

If `-a` is omitted, existing group memberships will be overwritten.

---

## 6️⃣ What is a primary group vs a secondary group?

- **Primary group** → Defined in `/etc/passwd`, used by default for new files
- **Secondary groups** → Additional group memberships defined in `/etc/group`

Primary group is changed using:
```
sudo usermod -g groupname username
```

---

## 7️⃣ Why can’t you delete a group that is a user’s primary group?

Because the system prevents removal of a group that is actively assigned as a primary group to a user.

You must first change the user’s primary group before deleting the group.

---

## 8️⃣ How do you lock and unlock a user account?

Lock:
```
sudo usermod -L username
```

Unlock:
```
sudo usermod -U username
```

Locking disables password authentication without deleting the account.

---

## 9️⃣ What is password aging in Linux?

Password aging enforces password lifecycle policies such as:
- Minimum days before change
- Maximum validity period
- Warning days before expiration

Managed using:
```
sudo chage username
```

---

## 🔟 How do you force a user to change password on next login?

```
sudo chage -d 0 username
```

This sets last password change date to zero.

---

## 1️⃣1️⃣ How can you check if there are duplicate UIDs in the system?

```
cut -d: -f3 /etc/passwd | sort | uniq -d
```

Duplicate UIDs can create serious privilege escalation risks.

---

## 1️⃣2️⃣ Why is UID 0 critical?

UID 0 represents the root account.

Any user with UID 0 has full administrative privileges.  
Only one account (root) should have UID 0.

---

## 1️⃣3️⃣ How do you audit failed login attempts?

On Ubuntu:
```
sudo grep "Failed password" /var/log/auth.log
```

This helps detect brute-force attacks.

---

## 1️⃣4️⃣ What is the importance of group-based access control?

Groups allow:
- Role-based access control (RBAC)
- Shared project permissions
- Reduced administrative overhead
- Centralized access management

Instead of assigning permissions per user, permissions are assigned to groups.

---

## 1️⃣5️⃣ What are common security best practices in user management?

- Disable unused accounts
- Remove system test users
- Enforce password aging
- Avoid UID duplication
- Monitor failed login attempts
- Restrict UID 0 access
- Use groups instead of direct permission assignment

---

# ✅ Summary

This lab demonstrates strong practical knowledge of:

- Linux account lifecycle management
- Secure privilege handling
- Role-based access control
- Password policy enforcement
- Security auditing

These concepts are essential for Linux System Administrators, SOC Engineers, and Security Analysts.
