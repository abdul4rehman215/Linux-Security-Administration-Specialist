# 🧪 Lab 04 – File Ownership and Permissions

---

# 🎯 Lab Objective

This lab focuses on mastering Linux file ownership, permission management, and advanced access control mechanisms.

By completing this lab, I successfully learned how to:

- Understand Linux permission model (rwx)
- Interpret numeric and symbolic permission notation
- Modify permissions using `chmod`
- Change ownership using `chown` and `chgrp`
- Configure default permissions using `umask`
- Implement advanced permissions using Access Control Lists (ACLs)
- Apply special permission bits (SUID, SGID, Sticky Bit)
- Troubleshoot permission-related issues

---

## 📌 Prerequisites

- Basic CLI knowledge
- Familiarity with ls, cd, pwd
- Understanding users & groups
- Sudo access

---

# 🖥 Lab Environment

- **OS:** Ubuntu 24.04.1 LTS
- **User:** toor
- **Host:** ip-172-31-10-241
- **Home Directory:** /home/toor
- **Privileges:** sudo enabled

---

# 📂 Repository Structure

```
lab04-file-ownership-and-permissions/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
├── scripts/
│   ├── test_script.sh
│   └── permission_test.sh
│
└── configs/
    └── bashrc_umask_addition.txt
```

---

# 🛠 Lab Tasks Overview

### Task 1 – Managing File Permissions
- Viewed default permissions
- Used symbolic and numeric chmod
- Applied recursive permission changes

### Task 2 – Managing Ownership
- Used chown and chgrp
- Modified group ownership
- Applied recursive ownership updates

### Task 3 – UMASK & ACL Configuration
- Tested default permission calculations
- Modified umask values
- Configured persistent umask
- Implemented user and group ACLs
- Managed ACL inheritance and masks

### Task 4 – Real-World Scenarios
- Web server directory permission hardening
- Shared directory with SGID and Sticky bit
- Secure configuration directories

### Task 5 – Verification & Auditing
- Created automated verification script
- Tested special permission bits
- Audited ACL and ownership configuration

---

# 🔐 Security Relevance

File permissions are one of the most critical components of Linux security.

Improper configuration can lead to:
- Data exposure
- Privilege escalation
- Web server compromise
- Unauthorized file modification

This lab reinforces:

- Principle of Least Privilege
- Role-Based Access Control (RBAC)
- Secure configuration management
- Enterprise system hardening practices

---

# 🌍 Real-World Applications

These skills directly apply to:

- Web server deployment (Apache/Nginx)
- Database file security
- DevOps CI/CD pipelines
- Multi-user enterprise systems
- SOC investigations
- Cloud Linux instance hardening

---

# 🧠 Key Learning Outcomes

✔ Permission calculation logic (666/777 minus umask)  
✔ Recursive permission strategy  
✔ Secure file isolation (600, 700)  
✔ Group collaboration using SGID  
✔ Controlled deletion using Sticky Bit  
✔ Advanced access control with ACL  
✔ Mask behavior in ACL systems  

---

# 📊 Result

All permission configurations, ACL implementations, special bits, and ownership changes were successfully tested and verified through automation script and manual inspection.

---

# 🎉 Conclusion

This lab strengthened my practical understanding of Linux access control mechanisms.

Mastering file ownership and permissions is foundational for:

- Linux System Administration  
- SOC Engineering  
- Cloud Security  
- Infrastructure Hardening  
- Enterprise Compliance  

This lab forms a critical building block for advanced Linux security topics and real-world secure system deployment.

---

✅ Lab 04 Completed Successfully
