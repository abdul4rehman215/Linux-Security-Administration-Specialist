# 🎤 Interview Q&A – Lab 7: Process Management and Monitoring

---

## 1️⃣ What is a process in Linux?

A process is a running instance of a program. Each process has a unique Process ID (PID), consumes system resources (CPU, memory), and has a lifecycle from creation to termination.

---

## 2️⃣ What is the difference between `ps` and `top`?

- `ps` provides a snapshot of running processes at the moment the command is executed.
- `top` provides real-time dynamic monitoring of processes and updates continuously.

`ps` is useful for scripting and filtering, while `top` is better for live system analysis.

---

## 3️⃣ What do the STAT values in `ps` output mean?

Common process states:

- R → Running
- S → Sleeping
- Z → Zombie
- T → Stopped
- D → Uninterruptible sleep

Understanding process states helps identify system health issues.

---

## 4️⃣ What is the difference between VSZ and RSS?

- VSZ (Virtual Memory Size): Total memory allocated to the process, including swapped and shared memory.
- RSS (Resident Set Size): Actual physical memory currently used by the process.

RSS is more accurate when diagnosing memory consumption.

---

## 5️⃣ What is a nice value in Linux?

Nice value determines process priority.

- Range: -20 (highest priority) to 19 (lowest priority)
- Default: 0
- Lower nice value = higher priority
- Higher nice value = lower priority

Only root can assign negative nice values.

---

## 6️⃣ What is the difference between `nice` and `renice`?

- `nice` → Starts a new process with a defined priority.
- `renice` → Modifies the priority of an already running process.

---

## 7️⃣ When would you use `kill -9`?

`kill -9` sends the SIGKILL signal, which forcefully terminates a process.

It should only be used when:

- A process is unresponsive
- SIGTERM does not work
- The process cannot be stopped normally

It does not allow cleanup before termination.

---

## 8️⃣ What is the difference between `kill`, `pkill`, and `killall`?

- `kill` → Terminates process by PID
- `pkill` → Terminates processes by name or pattern
- `killall` → Terminates all processes matching exact name

Use carefully to avoid unintended system impact.

---

## 9️⃣ How does cron help in process monitoring?

Cron automates script execution at scheduled intervals.

In this lab:
- System monitoring runs every 5 minutes
- CPU & memory alert checks run every 2 minutes
- Old logs are deleted daily

This enables proactive monitoring without manual intervention.

---

## 🔟 How can high CPU usage impact a system?

High CPU usage can:

- Slow down applications
- Increase system load average
- Cause performance degradation
- Affect multi-user environments
- Trigger service instability

Monitoring CPU helps maintain performance stability.

---

## 1️⃣1️⃣ What is load average?

Load average represents the number of processes waiting for CPU.

Three values:
- Last 1 minute
- Last 5 minutes
- Last 15 minutes

High load indicates CPU contention.

---

## 1️⃣2️⃣ Why is process monitoring important in security?

Process monitoring helps detect:

- Malicious processes
- Crypto miners
- Reverse shells
- Resource abuse
- Privilege escalation attempts
- Denial-of-service behavior

It is a key skill for SOC analysts and Linux administrators.

---

## 1️⃣3️⃣ What are best practices for process management?

- Monitor regularly
- Avoid unnecessary `kill -9`
- Use least privilege
- Automate monitoring
- Log abnormal behavior
- Set appropriate priority levels

---

## 1️⃣4️⃣ How does this lab relate to real-world Linux administration?

In production environments, administrators must:

- Identify runaway processes
- Control CPU/memory hogs
- Automate system health checks
- Maintain uptime
- Optimize performance

This lab directly simulates those responsibilities.

---

## 1️⃣5️⃣ How would you detect a zombie process?

Using:

```
ps aux | grep Z
```

Zombie processes show state `Z`.  
They indicate child processes not properly cleaned up by parent processes.

---

✅ Interview Preparation Complete

This lab builds strong foundational skills for:

- Linux System Administration
- Cloud Infrastructure Management
- SOC Operations
- DevOps Monitoring
- Performance Engineering
