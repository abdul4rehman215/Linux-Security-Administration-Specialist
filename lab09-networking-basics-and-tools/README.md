# 🧪 Lab 9: Networking Basics and Tools

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Use essential Linux networking commands (`ifconfig`, `ip`, `netstat`, `ss`)
- Configure and manage network interfaces
- Test network connectivity using `ping` and `traceroute`
- Analyze active network connections and listening services
- Understand routing tables and DNS configuration
- Perform temporary IP address modifications
- Detect open ports and services
- Build automated network diagnostic scripts
- Troubleshoot common network issues

---

## 🧰 Lab Environment

- **Operating System:** Ubuntu 20.04 LTS (Cloud VM)
- **Primary Interface:** eth0
- **Private IP:** 172.31.10.178
- **Gateway:** 172.31.0.1
- **DNS Resolver:** systemd-resolved

---

## 🧠 Key Topics Covered

### 1️⃣ Network Interface Management
- Traditional tool: `ifconfig`
- Modern tool: `ip`
- Viewing interface statistics
- Routing table inspection
- IPv4 filtering

### 2️⃣ Network Connection Analysis
- `netstat` (legacy tool)
- `ss` (modern socket statistics)
- Listening port inspection
- Process-to-port mapping
- TCP vs UDP analysis

### 3️⃣ Interface Configuration
- Adding secondary IP addresses
- Removing IP addresses
- Bringing interfaces up/down
- DNS configuration review

### 4️⃣ Connectivity Testing
- Localhost testing
- Gateway validation
- Internet reachability
- DNS resolution testing
- Continuous monitoring with timestamps
- Route tracing using `traceroute`

### 5️⃣ Advanced Network Diagnostics
- Port scanning via `ss`
- Port testing via `netcat`
- Real-time interface statistics
- Traffic observation
- Automated diagnostic reporting

---

## 📂 Repository Structure

```
lab09-networking-basics-and-tools/
├── README.md
├── commands.sh
├── scripts/
│   ├── network_comparison.sh
│   ├── network_monitor.sh
│   ├── connectivity_test.sh
│   └── network_diagnostic.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🛠 Scripts Developed in This Lab

| Script | Purpose |
|--------|----------|
| `network_comparison.sh` | Compare traditional vs modern networking tools |
| `network_monitor.sh` | Generate real-time network status report |
| `connectivity_test.sh` | Perform automated connectivity validation |
| `network_diagnostic.sh` | Full system network diagnostic report |

---

## 🔐 Why This Lab Matters (Security Relevance)

Understanding networking tools is foundational for:

- Detecting unauthorized open ports
- Identifying suspicious connections
- Diagnosing service exposure risks
- Investigating lateral movement
- Validating firewall and routing behavior
- Monitoring active sockets for compromise indicators

These skills are essential for:

- SOC Analysts
- Linux Administrators
- Cloud Engineers
- Security Engineers

---

## 🌍 Real-World Applications

This knowledge applies directly to:

- Cloud server troubleshooting
- Production outage diagnostics
- Firewall and network validation
- Security incident response
- Service exposure auditing
- DevOps deployment verification

---

## 🧩 What I Learned

- Difference between `ifconfig` and `ip`
- Difference between `netstat` and `ss`
- How Linux routing works
- How DNS resolution operates
- How to test end-to-end connectivity
- How to identify active services
- How to automate network health checks

---

## 🏁 Result

You now have the ability to:

✔ Inspect and manage Linux network interfaces  
✔ Analyze active connections and listening services  
✔ Diagnose routing and DNS issues  
✔ Detect exposed ports  
✔ Perform structured connectivity validation  
✔ Automate network diagnostics  
✔ Apply foundational network security analysis  

---

## ✅ Lab 9 Successfully Completed

This lab establishes the networking foundation required for:

- Linux Security & Administration
- SOC Monitoring
- Incident Response
- Cloud Infrastructure Management
