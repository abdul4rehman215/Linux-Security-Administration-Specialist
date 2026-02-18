# 🧪 Lab 7 – Process Management and Monitoring

---

## 🖥 Environment

- OS: Ubuntu 24.04.1 LTS (Cloud Lab Environment)
- User: toor
- Shell: Bash
- Host: ip-172-31-10-252

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Monitor system processes using `ps`, `top`, and `htop`
- Understand process states and resource utilization
- Manage processes using `kill`, `nice`, and `renice`
- Implement process priority control mechanisms
- Automate monitoring using `cron`
- Build alerting mechanisms for CPU and memory usage
- Develop a real-time dashboard for system visibility
- Create a comprehensive interactive process management toolkit

---

## 📚 Prerequisites

Before performing this lab:

- Basic Linux CLI knowledge
- Understanding of process concepts (PID, CPU, memory)
- Familiarity with file permissions and ownership
- Basic shell scripting knowledge
- Access to a Linux system with sudo privileges

---

# 🛠 Lab Tasks Overview

---

### 🔹 Task 1: Process Monitoring

- Used `ps` to inspect active processes
- Explored process tree structures
- Sorted processes by CPU and memory usage
- Monitored system load using `top`
- Installed and used `htop` for enhanced visualization

---

### 🔹 Task 2: Process Management

- Created CPU and memory intensive test scripts
- Tested process priority using `nice`
- Modified priorities using `renice`
- Managed background jobs
- Terminated processes using `kill`, `pkill`, and `killall`

---

### 🔹 Task 3: Automation with Cron

- Developed automated monitoring scripts
- Implemented CPU and memory alert scripts
- Configured cron jobs for scheduled execution
- Implemented automatic log cleanup
- Created a process monitoring dashboard
- Built an interactive process management toolkit

---

# 📊 Lab Results

- Verified process monitoring tools are functional
- Successfully controlled process priorities
- Demonstrated safe and forced process termination
- Implemented automated monitoring every 2–5 minutes
- Triggered real CPU alert using artificial load
- Validated cron scheduling
- Confirmed log generation and cleanup policy

---

## 📁 Folder Structure

```

lab07-process-management-and-monitoring/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
├── cpu_intensive.sh
├── memory_test.sh
└── process_monitoring/
    ├── system_monitor.sh
    ├── cpu_alert.sh
    ├── memory_alert.sh
    ├── dashboard.sh
    └── process_manager.sh

```

---

# 🧾 What I Learned

- Linux process lifecycle management
- System performance monitoring techniques
- CPU and memory usage analysis
- Process prioritization strategy
- Cron-based automation
- Log-based monitoring approach
- Real-time dashboard implementation
- Building interactive administrative tools in Bash

---

# 🌍 Why This Matters (Real-World Relevance)

Process management is critical in:

- Production Linux servers
- Cloud infrastructure environments
- DevOps monitoring pipelines
- SOC monitoring operations
- Incident response investigations
- Performance troubleshooting
- Resource optimization in multi-user systems

System administrators must:

- Identify runaway processes
- Control resource consumption
- Automate monitoring
- Detect abnormal CPU spikes
- Maintain system stability

This lab directly reflects real-world Linux administration responsibilities.

---

# 🏁 Result

✔ Process monitoring mastery  
✔ Priority control using nice/renice  
✔ Safe and force termination methods  
✔ Automated monitoring via cron  
✔ Alerting system implementation  
✔ Dashboard monitoring interface  
✔ Interactive process management toolkit  

---

## ✅ Lab 7 Successfully Completed

This lab establishes strong foundational skills in Linux process monitoring and management, preparing for advanced system administration and security operations tasks.

