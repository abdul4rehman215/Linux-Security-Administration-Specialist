# 🧪 Lab 03 – User and Group Management

---

# 🎯 Objective

This lab focuses on mastering Linux user and group management using core administrative utilities. It builds foundational skills required for secure multi-user system administration.

By completing this lab, I was able to:

- Create, modify, and delete user accounts using `useradd`, `usermod`, and `userdel`
- Create and manage groups using `groupadd` and `groupdel`
- Manage group memberships with `usermod -aG` and `gpasswd`
- Understand Linux account configuration files (`/etc/passwd`, `/etc/group`, `/etc/shadow`)
- Implement password aging and account expiration policies
- Perform auditing and security validation checks
- Automate bulk user operations using shell scripting
- Apply security best practices for access control

---

# 🖥 Lab Environment

- 🐧 Ubuntu 20.04 LTS  
- 👤 User: `toor`  
- 🌐 Host: `ip-172-31-10-213`  
- 📂 Working Directory: `/home/toor`  
- 🔐 Sudo privileges enabled  

---

# 📌 Prerequisites

- Basic Linux CLI knowledge
- Understanding of file permissions
- Familiarity with nano or vim
- Knowledge of Linux directory structure
- Access to sudo privileges

---

# 🛠 Lab Tasks Overview

## 🔹 Task 1 – Understanding Linux Account Files
- Examined `/etc/passwd`
- Examined `/etc/group`
- Reviewed `/etc/shadow`
- Analyzed file formats and account structure

## 🔹 Task 2 – User Account Management
- Created standard users
- Created system users
- Modified login shell and home directory
- Locked and unlocked accounts
- Changed UID values
- Deleted users safely and forcefully

## 🔹 Task 3 – Group Management
- Created standard and system groups
- Assigned specific GIDs
- Managed group memberships
- Set primary and secondary groups
- Deleted groups safely

## 🔹 Task 4 – Practical Team Scenario
- Built development team structure
- Configured shared project directory
- Implemented password aging policies
- Set account expiration
- Performed bulk user creation

## 🔹 Task 5 – Security & Auditing
- Checked for empty passwords
- Verified UID 0 accounts
- Audited login shells
- Checked duplicate UIDs
- Monitored login activity
- Verified failed login attempts

## 🔹 Task 6 – Cleanup & Verification
- Removed test users
- Removed test groups
- Verified system integrity

---

# 📁 Repository Structure

```
lab03-user-and-group-management/
│
├── README.md
├── commands.sh
├── scripts/
│   └── create_users.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🔐 Security Relevance

User and group management is foundational for:

- Access control enforcement
- Privilege management
- Enterprise identity management
- SOC monitoring
- Compliance auditing
- DevOps infrastructure security

Misconfigured user accounts are one of the most common causes of privilege escalation and lateral movement in enterprise environments.

---

# 🌍 Real-World Application

This lab directly applies to:

- Linux System Administration
- SOC Engineering
- IAM (Identity & Access Management)
- DevOps role-based access control (RBAC)
- Cloud server provisioning
- Enterprise security hardening

---

# 📈 Skills Gained

- Deep understanding of Linux account architecture
- Practical experience with real-world administrative scenarios
- Secure account lifecycle management
- Password policy enforcement
- Group-based permission control
- Auditing and monitoring techniques

---

# 🏁 Result

✔ Successfully created and managed multiple users  
✔ Implemented secure password and expiration policies  
✔ Configured role-based access using groups  
✔ Audited system security posture  
✔ Automated bulk user provisioning  
✔ Cleaned system safely  

---

# 🎉 Conclusion

This lab strengthened my understanding of Linux identity management and access control mechanisms.

User and Group Management is a critical pillar of Linux security and system administration, and this lab provided practical, production-relevant experience that directly applies to enterprise environments.

Lab 03 completed successfully.
