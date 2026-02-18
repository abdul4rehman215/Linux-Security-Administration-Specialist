# 🧪 Lab 11 – Managing Packages with APT / YUM (DNF)

---

## 🖥 Lab Environment

This lab was performed in a cloud-based Linux environment using:

- 🟢 Ubuntu 24.04.1 LTS (APT-based system)
- 🔵 CentOS Stream 9 (DNF-based system)
- AWS EC2 cloud instances
- User: toor
- Shell: Bash

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Install, upgrade, and remove software packages using APT and DNF
- Search and inspect package metadata
- Configure and manage repository sources
- Add third-party repositories using secure keyring methods
- Create automated package management scripts
- Implement automated update workflows
- Generate package inventory and restore scripts
- Troubleshoot common package management issues
- Apply system maintenance best practices

---

## 📚 Prerequisites

- Basic Linux command-line knowledge
- Understanding of file permissions and sudo access
- Familiarity with nano or vim
- Root or sudo privileges
- Foundational understanding of Linux package management concepts

---

# 📌 Lab Tasks Overview

This lab was divided into three major sections:

### 1️⃣ Basic Package Operations

Performed package lifecycle management on both:

- Ubuntu (APT)
- CentOS Stream (DNF)

Activities included:

- Identifying package manager
- Updating repositories
- Searching packages
- Viewing package metadata
- Installing packages
- Upgrading packages
- Removing packages
- Cleaning unused dependencies
- Verifying installation status

---

### 2️⃣ Repository Management

On Ubuntu:

- Reviewed APT repository configuration
- Backed up repository files
- Added third-party repository using modern keyring method
- Verified repository integrity

On CentOS:

- Reviewed DNF repository configuration
- Installed EPEL repository
- Created custom repository file
- Verified repository activation

---

### 3️⃣ Package Automation & Maintenance

Developed multiple automation scripts:

- Package status checker
- Repository health checker
- Interactive package automation tool
- Automated update script with logging
- Package inventory generator with restore capability

All scripts were tested successfully.

---

## 📁 Repository Structure

lab11-managing-packages/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── scripts/
│   ├── package_checker.sh
│   ├── repo_checker.sh
│   ├── package_automation.sh
│   ├── auto_update.sh
│   └── package_inventory.sh

---

## 🔐 Why This Matters

Proper package management is critical for:

- System stability
- Security patching
- Dependency integrity
- Production server reliability
- Compliance requirements
- Infrastructure automation

Mismanaged repositories or outdated packages can introduce serious vulnerabilities.

---

## 🌍 Real-World Applications

This lab directly applies to:

- Cloud server administration
- DevOps environments
- SOC patch management workflows
- Enterprise Linux maintenance
- Secure infrastructure deployment
- Disaster recovery planning
- Compliance auditing

---

## 📊 Results

- Successfully managed packages on both Debian and Red Hat ecosystems
- Added secure third-party repositories
- Automated update and maintenance processes
- Generated complete system package inventory
- Verified repository health and connectivity
- Logged automated system updates

All tasks executed successfully across both environments.

---

## 🧠 What I Learned

- Differences between APT and DNF package ecosystems
- Modern repository signing mechanisms
- Importance of repository trust validation
- How automation reduces human error
- Logging improves auditability
- Inventory scripts support disaster recovery
- Patch management is a core security responsibility

---

## ✅ Conclusion

This lab provided hands-on experience managing packages across two major Linux distributions.

Through repository configuration, automation scripting, update management, and inventory generation, I implemented real-world system administration practices suitable for production environments.

All objectives were completed successfully.
