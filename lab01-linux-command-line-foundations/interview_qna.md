# 🎤 Interview Questions & Answers  
## Lab 01 – Linux Command Line Foundations

---

### 1️⃣ What is the purpose of the `pwd` command?

`pwd` (Print Working Directory) displays the full absolute path of the current directory the user is working in. It helps confirm location before performing operations such as file deletion or copying.

---

### 2️⃣ What is the difference between absolute and relative paths?

- **Absolute Path:** Starts from the root directory (`/`) and provides the complete path (e.g., `/home/toor/documents`).
- **Relative Path:** Defined relative to the current working directory (e.g., `../documents`).

Absolute paths are safer in scripts and automation tasks.

---

### 3️⃣ What does the `-l` option do in the `ls` command?

The `-l` option provides a detailed listing format including:

- File permissions  
- Number of links  
- Owner  
- Group  
- File size  
- Last modified date  
- File name  

---

### 4️⃣ What does `ls -la` show?

`-a` shows hidden files (files beginning with `.`), and `-l` shows detailed information.  
Together, `ls -la` displays all files including hidden system configuration files.

---

### 5️⃣ What is the purpose of the `mkdir` command?

`mkdir` creates new directories.  
It is used to organize files and structure projects in a logical hierarchy.

---

### 6️⃣ What is the difference between `cp` and `mv`?

- `cp` copies files or directories.
- `mv` moves or renames files.

`mv` can also rename files without copying.

---

### 7️⃣ What does the `-r` option do in `cp`?

The `-r` (recursive) option allows copying directories along with their contents.  
Without `-r`, directories cannot be copied.

---

### 8️⃣ What is the purpose of `rm -r`?

`rm -r` recursively deletes directories and their contents.  
This command must be used carefully because deletion is permanent.

---

### 9️⃣ What does `rm -i` do?

The `-i` option enables interactive mode.  
It prompts the user for confirmation before deleting a file, reducing accidental deletions.

---

### 🔟 What is the difference between nano and vim?

- **nano:** Simple, beginner-friendly text editor.
- **vim:** Advanced modal editor with Normal, Insert, and Visual modes.

`vim` is more powerful and commonly used in enterprise Linux environments.

---

### 1️⃣1️⃣ What is modal editing in vim?

Modal editing means vim operates in different modes:

- Normal Mode (navigation & commands)
- Insert Mode (text editing)
- Visual Mode (text selection)

Each mode has specific functions.

---

### 1️⃣2️⃣ What does the `diff` command do?

`diff` compares two files and displays differences line-by-line.  
It is commonly used for configuration file comparisons and change validation.

---

### 1️⃣3️⃣ Why is file verification important after performing operations?

Verification ensures:

- Files were copied correctly  
- No accidental deletions occurred  
- Configuration changes were applied correctly  
- System integrity is maintained  

Commands like `ls`, `find`, `wc`, and `du` assist in validation.

---

### 1️⃣4️⃣ How can you count the number of files in a directory?

Using:

```
find . -type f | wc -l
```

This command finds all files recursively and counts them.

---

### 1️⃣5️⃣ Why are Linux command-line fundamentals important for cybersecurity?

Because:

- Security engineers manage servers via CLI.
- Incident response often requires terminal-based analysis.
- Configuration hardening is performed using command-line tools.
- SOC analysts investigate logs using CLI utilities.

Strong command-line knowledge is foundational for advanced Linux security and system administration.

---

## ✅ Summary

This lab strengthened practical understanding of:

- Directory navigation
- File operations
- Text editing
- File verification
- Linux workflow fundamentals

These are essential competencies for Linux system administrators and cybersecurity professionals.
