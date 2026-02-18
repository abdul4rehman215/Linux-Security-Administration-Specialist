# 🎤 Interview Q&A - Lab 12: SSH Security and Key Management

---

## 1️⃣ What is SSH and why is it important?

SSH (Secure Shell) is a cryptographic network protocol used for secure remote login and command execution over untrusted networks.

It ensures:
- Encrypted communication
- Secure authentication
- Data integrity
- Protection against eavesdropping

SSH is commonly the primary administrative access method for Linux servers.

---

## 2️⃣ What is the difference between password-based and key-based authentication?

| Password Authentication | Key-Based Authentication |
|--------------------------|--------------------------|
| Uses username/password | Uses public/private key pair |
| Vulnerable to brute force | Resistant to brute force |
| Requires server to accept passwords | Can disable passwords entirely |
| Less secure | More secure and recommended |

Key-based authentication is significantly more secure.

---

## 3️⃣ Why should root login be disabled in SSH?

Disabling root login:

- Prevents direct privileged access
- Reduces brute-force attack risk
- Forces attackers to guess both username and key
- Encourages least privilege access model

Best practice:
`
PermitRootLogin no
`

---

## 4️⃣ Why change the default SSH port (22)?

Changing the port:

- Reduces automated scanning noise
- Decreases exposure to script-based attacks
- Lowers brute-force attempts

However, it does NOT replace proper authentication hardening.

---

## 5️⃣ What file permissions are required for SSH to work securely?

Correct permissions are critical:

```
~/.ssh                → 700
~/.ssh/id_rsa         → 600
~/.ssh/id_rsa.pub     → 644
~/.ssh/authorized_keys → 600
```

Improper permissions cause SSH to reject authentication.

---

## 6️⃣ What is ssh-agent?

`ssh-agent` is a background process that:

- Stores decrypted private keys in memory
- Avoids repeated passphrase entry
- Improves usability while maintaining security

It allows secure key handling without exposing keys.

---

## 7️⃣ How does ssh-agent improve security?

- Keys are stored in memory, not disk
- Private keys remain encrypted on disk
- Reduces passphrase exposure
- Supports session-based key lifecycle

---

## 8️⃣ What is the purpose of the `authorized_keys` file?

The `authorized_keys` file:

- Contains public keys allowed for login
- Maps key to user account
- Enables passwordless authentication

Only matching private key holders can authenticate.

---

## 9️⃣ What is the purpose of SSH client config file (~/.ssh/config)?

It allows:

- Host aliases
- Custom ports
- Multiple identities
- Identity isolation
- Simplified SSH commands

Example:
`
Host myserver
 Port 2222
 IdentityFile ~/.ssh/id_rsa_server
`

---

## 🔟 What does `sshd -t` do?

It validates SSH configuration syntax without restarting the service.

This prevents:
- Locking yourself out
- Applying broken configurations
- Service failure due to syntax errors

Always test before restarting SSH.

---

## 1️⃣1️⃣ What is the Principle of Least Privilege in SSH context?

Users should:

- Only have necessary access
- Not login as root
- Be restricted using `AllowUsers`
- Have limited authentication attempts

Example:
`
AllowUsers testuser toor
`

---

## 1️⃣2️⃣ What is `MaxAuthTries` and why is it important?

`MaxAuthTries` limits login attempts per connection.

Reducing attempts:
- Slows brute-force attacks
- Limits authentication abuse
- Enhances security posture

---

## 1️⃣3️⃣ Why disable PasswordAuthentication?

Disabling passwords:

- Eliminates brute-force password attacks
- Forces secure key usage
- Prevents credential stuffing
- Increases authentication security

---

## 1️⃣4️⃣ How do you verify SSH hardening?

Check effective configuration:

`
sudo sshd -T
`

Verify:
- permitrootlogin no
- passwordauthentication no
- custom port
- maxauthtries reduced

Also verify service status and listening port.

---

## 1️⃣5️⃣ Why is SSH hardening critical in production?

Because SSH is often:

- The primary remote access method
- The first target of attackers
- Constantly scanned on the internet

Improper SSH configuration can lead to:
- Full system compromise
- Privilege escalation
- Data breaches

---

# ✅ Summary

This lab demonstrates real-world SSH hardening, identity management, and secure authentication practices aligned with modern Linux system security standards.
