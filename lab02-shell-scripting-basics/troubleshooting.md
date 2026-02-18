# 🛠 Troubleshooting Guide - Lab 02: Shell Scripting Basics

---

## 🔐 Issue 1: Permission Denied When Executing Script

### ❌ Problem
```
bash: ./script_name.sh: Permission denied
```

### 🔍 Cause
The script does not have execute permission.

### ✅ Resolution
Make the script executable:

```
chmod +x script_name.sh
```

Verify permissions:

```
ls -l script_name.sh
```

---

## 📂 Issue 2: Command Not Found

### ❌ Problem
```
command: not found
```

### 🔍 Possible Causes
- Command not installed
- PATH variable misconfigured
- Typographical error

### ✅ Resolution
Check if command exists:

```
which command_name
```

Install required package if missing:

```
sudo apt install package_name
```

Verify PATH:

```
echo $PATH
```

---

## 🔄 Issue 3: Variable Not Expanding Properly

### ❌ Problem
Script prints literal variable name instead of value.

Example:
```
echo "$NAME"
```
prints `$NAME`

### 🔍 Cause
Missing `$` symbol or incorrect quoting.

### ✅ Resolution
Ensure correct syntax:

```
echo "$VARIABLE"
echo "${VARIABLE}"
```

---

## 🔢 Issue 4: Arithmetic Errors

### ❌ Problem
Arithmetic operations fail or produce unexpected output.

### 🔍 Cause
Using incorrect syntax for arithmetic operations.

### ✅ Resolution
Use arithmetic expansion:

```
result=$((NUMBER % 2))
```

Avoid:

```
result=$NUMBER % 2   # Incorrect
```

---

## 🔁 Issue 5: Infinite While Loop

### ❌ Problem
Script never exits.

### 🔍 Cause
Loop condition never becomes false.

Example:
```
while true
```

### ✅ Resolution
Ensure counter is updated:

```
counter=$((counter - 1))
```

Validate loop exit condition carefully.

---

## 📄 Issue 6: File or Directory Not Found

### ❌ Problem
```
No such file or directory
```

### 🔍 Cause
Incorrect path or working directory.

### ✅ Resolution
Verify current directory:

```
pwd
```

Use absolute path:

```
/home/toor/shell_scripts/script.sh
```

---

## 🗃 Issue 7: Backup Verification Fails

### ❌ Problem
Source file count ≠ backup file count.

### 🔍 Possible Causes
- Hidden files not copied
- Permission restrictions
- cp command errors

### ✅ Resolution
Check source file count:

```
find "$SOURCE_DIR" -type f | wc -l
```

Check backup file count:

```
find "$BACKUP_DIR" -type f | wc -l
```

Ensure recursive copy:

```
cp -r source/* destination/
```

---

## 📝 Issue 8: Logging Not Working

### ❌ Problem
Log file not created or empty.

### 🔍 Cause
Log directory does not exist.

### ✅ Resolution
Ensure directory exists before logging:

```
mkdir -p "$BACKUP_BASE_DIR"
```

Verify write permissions:

```
ls -ld directory_name
```

---

## 🧪 Issue 9: Regex Validation Fails

### ❌ Problem
Numeric validation incorrectly rejects valid numbers.

### 🔍 Cause
Improper regex syntax.

### ✅ Resolution
Correct integer validation:

```
[[ "$NUMBER" =~ ^-?[0-9]+$ ]]
```

Test manually before implementing in script.

---

## 📊 Issue 10: System Report Missing Information

### ❌ Problem
System report does not include OS details.

### 🔍 Cause
`lsb_release` not installed.

### ✅ Resolution
Install required package:

```
sudo apt install lsb-release
```

---

## 🧩 Issue 11: Menu Loop Not Working Correctly

### ❌ Problem
Menu exits unexpectedly or repeats incorrectly.

### 🔍 Cause
Improper comparison syntax.

### ✅ Resolution
Use proper string comparison:

```
while [ "$choice" != "4" ]
```

Ensure quotes are included around variables.

---

## 🐞 Debugging Techniques

### Enable Execution Trace
Add at top of script:

```
set -x
```

This shows each command before execution.

---

### Check Exit Codes

After running a command:

```
echo $?
```

- 0 → Success  
- Non-zero → Failure  

---

### Add Debug Echo Statements

```
echo "DEBUG: Variable value is $VAR"
```

---

### Use ShellCheck

Install and run:

```
sudo apt install shellcheck
shellcheck script_name.sh
```

This identifies syntax errors and best practice violations.

---

# ✅ Final Validation Checklist

Before finalizing the lab:

- [ ] All scripts executable  
- [ ] No syntax errors  
- [ ] Backup verification passed  
- [ ] Logs generated correctly  
- [ ] Reports created successfully  
- [ ] Loop conditions terminate properly  
- [ ] No hardcoded insecure paths  

---

## 🎯 Final Note

Most shell scripting issues occur due to:

- Missing execute permissions
- Incorrect variable expansion
- Improper loop conditions
- Path misconfiguration
- Lack of input validation

Careful testing and incremental development prevent production-level failures in real-world Linux automation environments.
