# 🎤 Interview Q&A - Lab 02: Shell Scripting Basics

---

### 1️⃣ What is a shell script?

A shell script is a text file containing a series of Linux commands executed sequentially by a shell interpreter (e.g., Bash). It is used to automate repetitive tasks and system operations.

---

### 2️⃣ What is the purpose of the shebang (`#!/bin/bash`)?

The shebang specifies which interpreter should execute the script.  
`#!/bin/bash` ensures the script runs using the Bash shell.

---

### 3️⃣ How do you make a shell script executable?

Use the chmod command:

```
chmod +x script_name.sh
```

This adds execute permission to the script file.

---

### 4️⃣ What is the difference between `$VARIABLE` and `${VARIABLE}`?

Both access variable values.  
`${VARIABLE}` is preferred when concatenating variables with strings to avoid ambiguity.

Example:

```
echo "${NAME}_file"
```

---

### 5️⃣ How do you capture user input in Bash?

Using the `read` command:

```
read USER_INPUT
```

This stores user input into a variable.

---

### 6️⃣ What are conditional statements in Bash?

Conditional statements allow decision-making logic:

```
if [ condition ]; then
   commands
elif [ condition ]; then
   commands
else
   commands
fi
```

They are used for file checks, numeric comparisons, and validation.

---

### 7️⃣ How do you check if a file exists in Bash?

```
if [ -f filename ]; then
```

Common test operators:

- `-e` → exists  
- `-f` → regular file  
- `-d` → directory  
- `-r` → readable  

---

### 8️⃣ How do you validate numeric input in Bash?

Using regex pattern matching:

```
if ! [[ "$NUMBER" =~ ^-?[0-9]+$ ]]; then
```

This ensures the input is a valid integer.

---

### 9️⃣ What is the difference between for loop and while loop?

- **for loop:** Iterates over a known range or list.
- **while loop:** Runs until a condition becomes false.

For loops are ideal for fixed iterations; while loops are better for dynamic conditions.

---

### 🔟 What is a nested loop?

A nested loop is a loop inside another loop.  
It is commonly used for matrix processing, file hierarchy traversal, and pattern generation.

---

### 1️⃣1️⃣ How can you perform arithmetic in Bash?

Using arithmetic expansion:

```
$((expression))
```

Example:

```
result=$((5 * 3))
```

---

### 1️⃣2️⃣ What is command substitution?

Command substitution captures command output into a variable:

```
CURRENT_DATE=$(date)
```

This allows dynamic data usage inside scripts.

---

### 1️⃣3️⃣ Why is logging important in automation scripts?

Logging:

- Tracks execution steps
- Helps in debugging
- Maintains audit trail
- Improves accountability
- Supports incident investigation

---

### 1️⃣4️⃣ What is backup verification and why is it important?

Backup verification compares source file count with backup file count to ensure integrity.

It prevents:

- Silent data loss
- Incomplete backups
- Operational risk

---

### 1️⃣5️⃣ Why are shell scripting skills critical for cybersecurity professionals?

Because automation is essential for:

- Log analysis
- System monitoring
- Backup validation
- Threat detection scripts
- Incident response data gathering
- Security auditing

Shell scripting reduces manual errors and improves response time during security incidents.

---

## ✅ Summary

This lab demonstrated:

- Script creation and execution
- Variable handling and input validation
- Conditional logic implementation
- Loop control structures
- Nested logic processing
- System reporting automation
- File management automation
- Backup automation with integrity verification

These scripting capabilities form the backbone of Linux system automation and security engineering workflows.
