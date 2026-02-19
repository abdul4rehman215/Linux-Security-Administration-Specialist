# 🎤 Interview Q&A - Lab 19: Configuring SELinux for Security

---

### 1️⃣ What is SELinux and how is it different from traditional Linux permissions?

SELinux (Security-Enhanced Linux) is a Mandatory Access Control (MAC) system that enforces security policies independently of traditional Discretionary Access Control (DAC). Unlike standard file permissions where the owner controls access, SELinux enforces system-wide security rules even if the user is root.

---

### 2️⃣ What are the main SELinux modes?

SELinux operates in three modes:

- **Enforcing** – Policies are enforced and violations are blocked.
- **Permissive** – Violations are logged but not blocked.
- **Disabled** – SELinux is turned off.

In this lab, SELinux was running in **Enforcing mode**.

---

### 3️⃣ What is an SELinux security context?

A security context defines the security label assigned to files, processes, and resources. It follows this format:

```
user:role:type:level
```

Example:
```
system_u:object_r:httpd_sys_content_t:s0
```

The **type** field is the most important in policy enforcement.

---

### 4️⃣ What is an AVC denial?

An AVC (Access Vector Cache) denial occurs when SELinux blocks an action that violates its security policy. These denials are logged and can be analyzed using tools like `ausearch` or `sealert`.

---

### 5️⃣ How do you analyze SELinux denials?

Common tools used:

- `ausearch -m AVC`
- `journalctl`
- `sealert`
- `/var/log/audit/audit.log`

In this lab, these tools were used to identify blocked execution and file creation attempts.

---

### 6️⃣ What is audit2allow and when should it be used?

`audit2allow` converts AVC denial logs into SELinux policy rules. It should be used carefully, ensuring only necessary permissions are allowed to avoid over-permissive policies.

---

### 7️⃣ What is a SELinux policy module?

A policy module is a compiled SELinux rule set that defines allowed interactions between domains and file types. Modules are installed using:

```
semodule -i module_name.pp
```

---

### 8️⃣ Why is labeling important in SELinux?

Correct labeling ensures that processes interact only with authorized files. Incorrect labels often cause access denials even if traditional permissions allow access.

---

### 9️⃣ What are SELinux booleans?

Booleans are toggles that modify SELinux behavior without editing policy files. Example:

```
setsebool -P httpd_enable_cgi on
```

They allow flexible configuration without creating custom modules.

---

### 🔟 What is Mandatory Access Control (MAC)?

MAC enforces centrally controlled security policies that users cannot override. Even root privileges do not bypass MAC restrictions.

---

### 1️⃣1️⃣ Why is SELinux important in enterprise environments?

It provides:

- Application confinement
- Protection against privilege escalation
- Defense-in-depth
- Compliance with security standards
- Mitigation against zero-day exploits

---

### 1️⃣2️⃣ What is the difference between targeted and MLS policies?

- **Targeted policy** protects specific services (e.g., httpd, sshd).
- **MLS (Multi-Level Security)** provides sensitivity-based access control used in high-security environments.

This lab used the **targeted policy**.

---

### 1️⃣3️⃣ How do you manage SELinux file contexts?

Using:

```
semanage fcontext
restorecon
```

`semanage` defines context rules, while `restorecon` applies them.

---

### 1️⃣4️⃣ What happens if SELinux blocks a legitimate application?

You should:

1. Analyze the denial logs.
2. Verify labeling.
3. Adjust booleans if applicable.
4. Generate a minimal custom policy module if required.

Disabling SELinux should not be the first option.

---

### 1️⃣5️⃣ How does SELinux improve defense-in-depth?

Even if:

- An application is exploited
- A service is compromised
- Traditional permissions are bypassed

SELinux confines the process within its allowed domain, preventing lateral movement and system-wide compromise.

---

## ✅ Summary

This lab demonstrates practical SELinux administration, including:

- Policy analysis
- Denial investigation
- Module creation
- Application confinement
- Secure enforcement in production-style environments

These are essential skills for Linux Security Engineers and DevSecOps professionals.
