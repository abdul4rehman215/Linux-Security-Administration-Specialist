
# 🛠️ Troubleshooting Guide - Lab 13: Network Monitoring with Tcpdump

---

## Issue 1: Permission Denied When Running Tcpdump

### Symptoms
- Error: `tcpdump: ens5: You don't have permission to capture on that device`
- Or: `Operation not permitted`

### Cause
Tcpdump requires root privileges to capture packets from network interfaces.

### Solution

Run tcpdump with sudo:

```bash
sudo tcpdump -i ens5
````

Optional: Add user to appropriate group (if configured):

```bash
sudo usermod -a -G wireshark $USER
```

Then log out and log back in.

---

## Issue 2: Network Interface Not Found

### Symptoms

* Error: `tcpdump: ens5: No such device exists`

### Cause

Incorrect interface name used.

### Solution

List available interfaces:

```bash
ip link show
```

Or:

```bash
sudo tcpdump -D
```

Then use the correct interface name.

---

## Issue 3: No Packets Captured

### Symptoms

* Tcpdump runs but shows no traffic.

### Possible Causes

* No active network traffic
* Monitoring wrong interface
* Firewall blocking traffic

### Solutions

Generate traffic manually:

```bash
ping -c 3 8.8.8.8
curl http://example.com
```

Verify interface is up:

```bash
ip link show ens5
```

---

## Issue 4: Unable to Read Saved .pcap Files

### Symptoms

* `Permission denied` when reading capture files

### Cause

Files saved with root ownership.

### Solution

Change file ownership:

```bash
sudo chown $USER:$USER *.pcap
```

Or always read using sudo:

```bash
sudo tcpdump -r capture.pcap
```

---

## Issue 5: Corrupted or Incomplete Capture File

### Symptoms

* Tcpdump shows truncated output
* Wireshark fails to open file

### Cause

Tcpdump process was forcefully terminated.

### Solution

Stop tcpdump gracefully using:

```bash
Ctrl + C
```

Or use:

```bash
sudo kill -2 <PID>
```

Signal `-2` ensures clean termination.

---

## Issue 6: Capture File Growing Too Large

### Symptoms

* Disk usage increases rapidly
* Capture file consumes large storage

### Cause

Unlimited packet capture.

### Solution

Limit packet count:

```bash
sudo tcpdump -i ens5 -c 100
```

Or use file rotation:

```bash
sudo tcpdump -i ens5 -C 10 -W 5 -w capture.pcap
```

(Creates rotating capture files)

---

## Issue 7: Cannot Detect Suspicious Traffic

### Symptoms

* Security filters return no results.

### Cause

Incorrect filter syntax.

### Solution

Test basic filter first:

```bash
tcpdump -r file.pcap tcp
```

Then refine filter carefully:

```bash
tcpdump -r file.pcap 'tcp[tcpflags] & tcp-syn != 0'
```

Always test filters incrementally.

---

## Issue 8: SSH Port Change Not Captured

### Symptoms

* SSH traffic not appearing on port 22 filter.

### Cause

SSH service may be running on a non-default port.

### Solution

Check SSH listening port:

```bash
sudo ss -tlnp | grep ssh
```

Capture on correct port:

```bash
sudo tcpdump -i ens5 port 2222
```

---

## Issue 9: DNS Traffic Not Appearing

### Cause

System using local DNS resolver (127.0.0.53).

### Solution

Capture all DNS:

```bash
sudo tcpdump -i ens5 port 53 or port 5353
```

---

## Issue 10: High CPU Usage During Capture

### Cause

Verbose output or large packet volume.

### Solution

Disable name resolution:

```bash
sudo tcpdump -n -i ens5
```

Limit capture count:

```bash
sudo tcpdump -i ens5 -c 50
```

---

# Professional Notes

* Always test filters before production monitoring.
* Never capture traffic on production systems without authorization.
* Rotate and archive capture files regularly.
* Protect .pcap files — they may contain sensitive information.
* Monitor disk usage during long capture sessions.

---

## Final Verification Checklist

✔ Tcpdump installed and verified
✔ Correct interface identified
✔ Filters tested successfully
✔ Packet capture saved properly
✔ Analysis scripts executed successfully
✔ Security patterns identified
✔ Monitoring scripts automated successfully

---

This troubleshooting guide ensures reliable network monitoring and professional-grade incident analysis using tcpdump.

