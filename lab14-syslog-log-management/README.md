# 🟢 Lab 14: Syslog and Log Management

## 📌 Lab Overview

This lab demonstrates comprehensive log management on a Linux system using:

- rsyslog (traditional syslog daemon)
- systemd-journald (journal logging system)
- journalctl (log querying tool)
- logrotate (automated log rotation utility)

The lab was performed in an Ubuntu 24.04.1 LTS cloud environment.

---

## 🎯 Objectives

By completing this lab, the following skills were developed:

- Configure and manage system logs using rsyslog
- Implement remote logging capabilities
- Use journalctl to query and filter logs
- Automate log rotation with logrotate
- Understand syslog and systemd journal integration
- Perform log monitoring and troubleshooting

---

## 🧰 Prerequisites

- Basic Linux command-line knowledge
- Understanding of file permissions and ownership
- Familiarity with text editors (nano, vim, or gedit)
- Knowledge of systemd services
- Basic networking concepts (IP addresses, ports)

---

## 🖥 Environment Used

- OS: Ubuntu 24.04.1 LTS (Cloud EC2)
- Services:
  - rsyslog
  - systemd-journald
  - logrotate
- Tools:
  - journalctl
  - logger
  - grep
  - tail

---

## 🗂 Repository Structure

```

Lab_14_Syslog_Log_Management/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
├── generate_logs.sh
├── monitor_rotation.sh
└── log_analysis.sh

```

---

## 🛠 Lab Tasks Overview

### Task 1: Configure rsyslog
- Verified rsyslog service
- Enabled TCP/UDP remote logging
- Created custom remote templates
- Tested local and simulated remote logging

### Task 2: Manage Logs with journalctl
- Viewed logs by boot/session
- Filtered by service and priority
- Managed journal storage
- Generated test log entries

### Task 3: Automate Log Rotation
- Analyzed default logrotate configuration
- Created custom logrotate policy
- Tested forced rotation
- Implemented advanced rotation policies
- Built monitoring and analysis scripts

---

## 📊 Results

- Remote logging successfully enabled on port 514
- journalctl filtering validated
- Custom logrotate policies functioning
- Automated monitoring scripts verified
- Integrated logging pipeline tested successfully

---

## 🔐 Why This Matters

Log management is critical in:

- Security monitoring
- Incident response
- Compliance auditing
- Production server administration
- SOC environments

Proper logging enables:

- Early threat detection
- Faster troubleshooting
- Regulatory compliance
- Forensic investigations

---

## 🌍 Real-World Applications

- Centralized logging servers
- SIEM integrations
- Compliance frameworks (PCI-DSS, ISO 27001)
- Cloud infrastructure monitoring
- Enterprise production systems

---

## 📚 Key Takeaways

- rsyslog and journald complement each other
- Centralized logging improves visibility
- Automated log rotation prevents disk exhaustion
- Structured logging enables faster incident response
- Monitoring scripts improve operational awareness

---

## ✅ Final Status

✔ rsyslog configured  
✔ Remote logging enabled  
✔ journalctl filtering tested  
✔ logrotate automation implemented  
✔ Advanced log rotation validated  
✔ Full logging pipeline verified  

---

**Lab Completed Successfully**
