# 🧪 Lab 8: Systemd for Service Management

---

# 🎯 Objectives

By completing this lab, I achieved the following:

- Understood the architecture and role of **systemd** in modern Linux systems
- Managed services using `systemctl`
- Created and configured custom service unit files
- Implemented service dependencies
- Used `journalctl` for log monitoring and filtering
- Troubleshot failed services using system logs
- Applied security best practices using dedicated service users

---

# 📘 Prerequisites

- Basic Linux command-line knowledge  
- Understanding of processes and services  
- Familiarity with file permissions and ownership  
- Text editor experience (nano/vim)  
- Root or sudo privileges  

---

# 🖥 Lab Environment

- Distribution: Ubuntu (systemd-based system)
- systemd version: 255
- Root access available
- Default system services enabled

---

# 🔹 Task Overview

## Task 1: Service Control with systemctl

- Checked systemd version and system state
- Listed active and available service units
- Started, stopped, restarted, and reloaded services
- Enabled and disabled services at boot
- Used mask and unmask functionality
- Explored service dependencies

---

## Task 2: Creating Custom systemd Services

- Created a basic custom service (`myservice`)
- Developed an advanced environment-based service (`advanced-service`)
- Implemented restart policies and service dependencies
- Configured logging behavior
- Created and troubleshot a failing service (`problem-service`)
- Applied security hardening using a dedicated non-root service user

---

## Task 3: Monitoring with journalctl

- Viewed global and service-specific logs
- Filtered logs by priority and time
- Followed real-time service logs
- Exported logs for analysis
- Rotated and vacuumed journal logs
- Verified journal integrity

---

## 📂 Lab Directory Structure

```
lab08-systemd-service-management/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
├── scripts/
│   ├── myservice.sh
│   ├── advanced-service.sh
│   └── problem-service.sh
│
└── service-files/
    ├── myservice.service
    ├── advanced-service.service
    ├── problem-service.service
    └── advanced-service.env
```

---

# 🔐 Security Implementation

During this lab, I:

- Created a dedicated system user (`myservice-user`)
- Updated service configuration to run without root
- Adjusted file ownership and permissions
- Verified least privilege execution

This aligns with production security best practices.

---

# 🌍 Real-World Relevance

Systemd service management is essential for:

- Production server management
- DevOps automation
- Application deployment
- Cloud infrastructure
- SOC operations and service monitoring
- High-availability environments

Understanding systemd enables reliable service orchestration and automated recovery.

---

# 📊 Result

At the end of this lab:

- Custom services were successfully deployed
- Services were enabled for boot
- Logging and monitoring were validated
- Troubleshooting scenarios were tested and resolved
- Security hardening was applied successfully

---

# 🧠 What I Learned

- How systemd handles services and dependencies
- Service lifecycle management
- How restart policies improve reliability
- Journal-based logging analysis
- How to diagnose service failures effectively
- Production-grade service configuration practices

---

# ✅ Lab 8 Successfully Completed

This lab strengthened my Linux administration skills and prepared me for:

- Managing enterprise Linux systems
- Service deployment in cloud environments
- Secure service configuration
- Production troubleshooting
