# 🔐 Lab 19: Configuring SELinux for Security

---

## 🖥 Environment

- OS: CentOS Linux 7 (Core)
- Shell: bash-4.2
- SELinux Mode: Enforcing
- SELinux Policy: Targeted
- Root Access: Available

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand SELinux fundamentals and security contexts
- Analyze SELinux modes and policy types
- Configure file security contexts using `semanage`
- Apply Mandatory Access Control (MAC)
- Generate and analyze AVC denials
- Use `audit2allow` to create policy modules
- Create and compile custom SELinux policy modules
- Define new SELinux types and domains
- Manage SELinux booleans and port contexts
- Verify secure enforcement under Enforcing mode

---

## 📚 Prerequisites

Before starting this lab, the following knowledge was required:

- Basic Linux command-line operations
- Understanding of file permissions and ownership
- Familiarity with system administration tasks
- Experience with text editors (vi/vim or nano)
- Basic understanding of Linux security concepts

---

## 🧩 Lab Tasks Overview

### 🟢 Task 1: Configure SELinux Policies for File Access

- Reviewed SELinux security contexts
- Created a custom directory structure
- Applied custom file contexts using `semanage`
- Used `restorecon` to enforce labeling
- Integrated Apache with SELinux enforcement
- Verified context enforcement behavior

---

### 🟢 Task 2: Troubleshoot SELinux Denials with audit2allow

- Generated intentional SELinux denials
- Analyzed AVC logs using:
  - `ausearch`
  - `journalctl`
  - `sealert`
- Generated policy rules using `audit2allow`
- Created and installed custom policy modules
- Validated resolution of access denials

---

### 🟢 Task 3: Create Custom SELinux Policies

- Designed a custom application with structured directories
- Defined new SELinux types and application domain
- Created policy source (`.te`) and file context (`.fc`) files
- Compiled policy using SELinux development tools
- Installed custom policy modules
- Applied file contexts and restored labels
- Verified enforcement without AVC denials
- Tested application under SELinux Enforcing mode

---

### 🔵 Advanced SELinux Management

- Managed SELinux booleans
- Configured persistent boolean settings
- Managed SELinux port labeling
- Verified installed policy modules
- Conducted comprehensive enforcement validation

---

## 📁 Repository Structure

```
lab19-configuring-selinux-for-security/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
├── scripts/
│   ├── test_script.sh
│   ├── custom_app.sh
│   └── myapp
│
├── policies/
│   ├── mypolicy.te
│   ├── custom_app_policy.te
│   ├── myapp_policy.te
│   ├── myapp_policy.fc
│
└── configs/
    └── app.conf
```

---

## 🧠 What I Learned

- How SELinux enforces Mandatory Access Control
- How security contexts control system access
- How to interpret AVC denials
- How to safely generate policy modules using `audit2allow`
- How to design confined application domains
- How SELinux enhances system security beyond traditional permissions
- How enterprise Linux systems implement policy-based security

---

## 🔐 Why This Matters

SELinux provides Mandatory Access Control (MAC), ensuring:

- Applications operate within strictly defined boundaries
- Compromised services cannot escalate privileges easily
- System integrity remains protected even if services are exploited
- Security enforcement remains active regardless of traditional file permissions

This is critical for:

- Enterprise Linux hardening
- Secure web server deployment
- Application confinement
- Regulatory compliance environments
- Incident response investigations

---

## 🌍 Real-World Relevance

SELinux is widely used in:

- Red Hat Enterprise Linux environments
- Government and defense systems
- Financial institutions
- Cloud infrastructure deployments
- High-security production servers

Understanding SELinux policy development is a required skill for:

- Linux Security Engineers
- DevSecOps Professionals
- System Administrators
- SOC Engineers
- Cloud Security Engineers

---

## 📊 Result

- SELinux verified in Enforcing mode
- Custom file contexts successfully applied
- AVC denials analyzed and resolved
- Policy modules generated and installed
- Custom application domain created and enforced
- No policy violations under strict enforcement

---

## ✅ Conclusion

In this lab, I implemented advanced SELinux configurations, created custom policy modules, and validated enforcement under Enforcing mode.  

This exercise demonstrated how Mandatory Access Control provides an additional security layer beyond traditional Linux permissions, forming a strong foundation for enterprise-level Linux security management.

---

🏁 Lab 19 Completed Successfully
