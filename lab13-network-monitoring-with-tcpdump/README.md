# 🌐 Lab 13: Network Monitoring with Tcpdump

---

## 📌 Overview

This lab focuses on real-time network traffic monitoring, packet capture, traffic analysis, and security incident detection using **tcpdump** on a Linux system.

All activities were performed in:

- **Ubuntu 24.04.1 LTS**
- Primary Interface: `ens5`
- Cloud-based lab environment
- Host: `toor@ip-172-31-10-241`

---

## 🎯 Objectives

By completing this lab, the following skills were developed:

- Install and verify tcpdump
- Capture live network traffic
- Apply protocol, port, host, and complex filters
- Save packet captures to `.pcap` files
- Analyze traffic for security incidents
- Detect suspicious network patterns
- Automate traffic analysis using scripts
- Simulate security incidents
- Build monitoring dashboards

---

## 🧰 Prerequisites

- Linux command-line knowledge
- Networking fundamentals (IP, ports, protocols)
- Basic understanding of network security
- Root or sudo privileges
- Familiarity with packet capture concepts

---

## 🛠 Tasks Performed

### Task 1 – Installation & Setup
- Verified tcpdump installation
- Checked version and libpcap
- Identified active network interface (`ens5`)
- Listed available capture interfaces

### Task 2 – Basic Packet Capture
- Captured all traffic
- Limited packet counts
- Used verbose mode
- Displayed packet contents (Hex & ASCII)

### Task 3 – Filtering Traffic
- Protocol-based filtering (TCP, UDP, ICMP)
- Port-based filtering (80, 443, 22, 53)
- Host-based filtering
- Complex logical filters
- Network subnet filtering

### Task 4 – Saving & Reading PCAP Files
- Created capture directory
- Saved captures to `.pcap` files
- Read and analyzed stored traffic

### Task 5 – Security Traffic Analysis
- Generated controlled network traffic
- Captured suspicious activity
- Identified SYN packets
- Detected DNS and SSH attempts
- Analyzed potential scanning behavior

### Task 6 – Advanced Analysis & Automation
- Built traffic analysis scripts
- Created security monitoring scripts
- Generated protocol distribution reports
- Identified top destination ports
- Extracted unique hosts

### Task 7 – Simulated Security Incident
- Simulated SSH brute attempts
- Generated DNS burst traffic
- Simulated file transfer via port 8080
- Captured incident traffic
- Performed forensic analysis

### Task 8 – Custom Monitoring Dashboard
- Built multi-session capture dashboard
- Automated traffic categorization
- Created summary analysis reports

---

## 📂 Repository Structure

```
lab13-network-monitoring-with-tcpdump/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── scripts/
    ├── generate_traffic.sh
    ├── analyze_traffic.sh
    ├── security_monitor.sh
    ├── simulate_incident.sh
    ├── network_monitor.sh
    └── analyze_all.sh
```

---

## 🔐 Security Concepts Applied

- Packet-level traffic inspection
- SYN scan detection
- Port-based monitoring
- DNS activity monitoring
- Protocol distribution analysis
- Traffic anomaly detection
- Incident response workflow
- Network forensic investigation

---

## 📊 Results

- Successfully captured live traffic
- Applied advanced filters
- Detected simulated SSH scanning behavior
- Identified DNS burst patterns
- Logged suspicious activity
- Generated automated analysis reports
- Built reusable monitoring scripts

---

## 🌍 Real-World Relevance

Tcpdump is a foundational tool used in:

- SOC environments
- Incident response teams
- Network troubleshooting
- Threat detection workflows
- Compliance auditing
- Digital forensics

Understanding raw packet capture strengthens core cybersecurity capabilities and supports advanced tools like Wireshark, Suricata, and SIEM platforms.

---

## 🧠 What I Learned

- How to capture and interpret raw packet data
- How to isolate traffic using BPF filters
- Detecting SYN-based scanning behavior
- Identifying suspicious network activity
- Creating automated traffic analysis workflows
- Simulating realistic security incidents
- Building reusable monitoring solutions

---

## 🏁 Conclusion

This lab provided hands-on experience in packet capture, network traffic analysis, and security incident detection using tcpdump.

The ability to monitor, filter, analyze, and automate network traffic inspection is a critical skill for cybersecurity professionals.

The scripts and workflows developed in this lab can be adapted to real production environments for monitoring and threat detection.
