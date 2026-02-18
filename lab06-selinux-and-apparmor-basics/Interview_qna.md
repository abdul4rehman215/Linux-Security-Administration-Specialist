# 🎤 Interview Q&A - Lab 06: SELinux and AppArmor

---

## 🔐 SECTION 1 – Mandatory Access Control (MAC) Fundamentals

---

### 1️⃣ What is the difference between DAC and MAC?

**Answer:**

DAC (Discretionary Access Control):

* Owner of a file decides permissions.
* Based on user/group/other permission bits.
* Can be changed by file owner.
* Vulnerable to privilege escalation if account compromised.

MAC (Mandatory Access Control):

* System-enforced security policy.
* Users cannot override policy.
* Based on labels (SELinux) or paths (AppArmor).
* Even root is restricted.

Example:
Even if Apache has file permissions, SELinux can still block it.

---

### 2️⃣ Why is MAC considered more secure than DAC?

Because:

* It enforces least privilege at kernel level.
* Policies are centrally defined.
* Prevents lateral movement.
* Limits impact of compromised services.
* Blocks privilege escalation paths.

MAC = Defense-in-depth layer.

---

### 3️⃣ What is SELinux?

**Answer:**

SELinux (Security-Enhanced Linux) is a label-based Mandatory Access Control system integrated into the Linux kernel.

It enforces security policies by labeling:

* Files
* Processes
* Users
* Ports

Every interaction is validated against policy rules.

---

### 4️⃣ What is AppArmor?

AppArmor is a path-based Mandatory Access Control system.

Instead of labels, it:

* Restricts applications by filesystem paths
* Uses profile files
* Easier to configure than SELinux
* Common in Ubuntu and SUSE

---

## 🔐 SECTION 2 – SELinux Deep Technical Questions

---

### 5️⃣ What are SELinux modes?

1. Enforcing – Blocks unauthorized actions.
2. Permissive – Logs violations but does not block.
3. Disabled – SELinux is off.

Command to check:

```
getenforce
```

---

### 6️⃣ What are SELinux contexts?

SELinux context format:

```
user:role:type:level
```

Example:

```
system_u:object_r:httpd_sys_content_t:s0
```

Components:

* user → SELinux user
* role → SELinux role
* type → Type enforcement (most important)
* level → MLS level

---

### 7️⃣ What is Type Enforcement?

Type Enforcement (TE) is the core SELinux model.

It defines:

* What type of process can access
* What type of file

Example:

```
httpd_t can read httpd_sys_content_t
```

If file is `default_t`, access denied.

---

### 8️⃣ What is the difference between chcon and semanage?

`chcon`

* Temporary context change
* Lost after restorecon or relabel

`semanage fcontext`

* Permanent policy modification
* Survives restorecon and reboot

Production rule:
Always use `semanage` for persistent fixes.

---

### 9️⃣ How do you troubleshoot SELinux denials?

Steps:

1. Check audit logs

```
ausearch -m AVC -ts recent
```

2. Use sealert

```
sealert -a /var/log/audit/audit.log
```

3. Analyze suggested fix
4. Apply semanage fcontext
5. Restore context

---

### 🔟 What are SELinux Booleans?

Booleans allow toggling specific policy behaviors without rewriting policy.

Example:

```
setsebool httpd_can_network_connect on
```

Permanent:

```
setsebool -P httpd_can_network_connect on
```

Used for:

* Allowing network access
* Enabling DB connectivity
* Allowing FTP access

---

### 1️⃣1️⃣ Why did Apache fail to access /custom-web?

Because file context was:

```
default_t
```

Apache runs under:

```
httpd_t
```

Policy does not allow `httpd_t` to read `default_t`.

After fixing:

```
httpd_sys_content_t
```

Access allowed.

---

## 🔐 SECTION 3 – AppArmor Deep Technical Questions

---

### 1️⃣2️⃣ What is the difference between SELinux and AppArmor?

| SELinux             | AppArmor          |
| ------------------- | ----------------- |
| Label-based         | Path-based        |
| Complex             | Simpler           |
| Fine-grained        | Easier management |
| Used in RHEL/CentOS | Used in Ubuntu    |

SELinux → stronger granularity
AppArmor → easier deployment

---

### 1️⃣3️⃣ What are AppArmor modes?

1. Enforce → Blocks violations
2. Complain → Logs but does not block
3. Kill → Terminates violating processes

Command:

```
aa-status
```

---

### 1️⃣4️⃣ How do you generate an AppArmor profile?

```
aa-genprof /path/to/application
```

Steps:

* Run application
* Allow required accesses
* Save profile
* Enforce profile

---

### 1️⃣5️⃣ Where are AppArmor profiles stored?

```
/etc/apparmor.d/
```

Profile example:

```
usr.local.bin.test-app.sh
```

---

### 1️⃣6️⃣ How do you troubleshoot AppArmor denials?

Check logs:

```
dmesg | grep -i apparmor
journalctl | grep -i apparmor
```

Use:

```
aa-logprof
```

To review and adjust profile.

---

## 🔐 SECTION 4 – Advanced & Scenario-Based Questions

---

### 1️⃣7️⃣ What happens if SELinux is disabled?

* Kernel does not enforce MAC
* System falls back to DAC only
* Increased risk of exploitation
* Compliance failure in regulated environments

Best practice:
Never disable SELinux in production.

---

### 1️⃣8️⃣ Does SELinux impact performance?

Minimal.

In lab test:
Difference ≈ 0.03 seconds.

SELinux overhead is negligible for modern hardware.

---

### 1️⃣9️⃣ How does MAC help prevent ransomware?

If compromised process tries:

* Access sensitive files
* Modify system files
* Escalate privileges

MAC blocks access based on policy.

Example:
Web server cannot access `/etc/shadow`.

---

### 2️⃣0️⃣ In enterprise environments, when would you choose SELinux over AppArmor?

Choose SELinux when:

* High security environment
* Government systems
* Financial institutions
* Compliance heavy systems
* Need fine-grained policy control

Choose AppArmor when:

* Rapid deployment needed
* Ubuntu-based infrastructure
* Simpler management required

---

## 🔐 SECTION 5 – Real-World Enterprise Questions

---

### 2️⃣1️⃣ How would you secure a production web server using SELinux?

1. Keep enforcing mode
2. Label content correctly
3. Use semanage for custom directories
4. Enable necessary booleans
5. Monitor AVC logs
6. Regular audit reviews

---

### 2️⃣2️⃣ What is the biggest mistake admins make with SELinux?

Disabling it instead of fixing policy properly.

Correct method:

* Identify denial
* Fix context
* Modify boolean
* Update policy

---

### 2️⃣3️⃣ Can root bypass SELinux?

No.

SELinux policy enforcement occurs at kernel level.

Even root cannot bypass policy unless SELinux disabled.

---

### 2️⃣4️⃣ How do containers use SELinux?

Docker and Podman use SELinux labels to isolate containers.

Example types:

```
container_t
container_file_t
```

Prevents container breakout.

---

### 2️⃣5️⃣ Why is MAC important in compliance standards?

Standards like:

* PCI-DSS
* HIPAA
* ISO 27001

Require:

* Access control enforcement
* Audit logging
* Least privilege

MAC systems fulfill these requirements.

---

# 🏁 Final Interview Tip

If interviewer asks:

“Why should we enable SELinux in production?”

Answer:

Because it provides kernel-level mandatory access control that prevents lateral movement, privilege escalation, and unauthorized resource access — even when applications or users are compromised. It significantly reduces attack surface without noticeable performance impact.

---

# ✅ Interview Readiness Level

After completing this lab, you are ready for:

* Linux Security Engineer interviews
* DevSecOps interviews
* SOC Engineer interviews
* System Administrator security roles
* Enterprise Linux hardening roles

---
