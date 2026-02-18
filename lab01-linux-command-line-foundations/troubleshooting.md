# 🛠 Troubleshooting Guide - Lab 01: Linux Command Line Foundations

---

## 🔐 Issue 1: Permission Denied Error

### ❌ Problem
While attempting to access or modify a file, the system displays:

`
Permission denied
`

### 🔍 Possible Causes
- File permissions do not allow read/write access.
- File is owned by another user.
- Attempting to access restricted system directories.

### ✅ Resolution

1. Check file permissions:
```
ls -l filename
```

2. Modify permissions if required:
```
chmod 644 filename
```

3. If ownership is incorrect:
```
sudo chown username:username filename
```

4. If accessing system directories, use:
```
sudo command
```

---

## 📂 Issue 2: File Not Found Error

### ❌ Problem
System displays:

`
No such file or directory
`

### 🔍 Possible Causes
- Incorrect path
- Typographical error
- Wrong working directory

### ✅ Resolution

1. Confirm current directory:
```
pwd
```

2. List directory contents:
```
ls -la
```

3. Use tab auto-completion to avoid spelling mistakes.

4. Verify absolute path:
```
ls /full/path/to/file
```

---

## 📝 Issue 3: Stuck Inside vim Editor

### ❌ Problem
User cannot exit vim.

### 🔍 Cause
User is inside Insert Mode or unaware of vim command modes.

### ✅ Resolution

1. Press `Esc` multiple times to enter Normal Mode.
2. To quit without saving:
```
:q!
```
3. To save and quit:
```
:wq
```

---

## 🧭 Issue 4: Unable to Navigate to Directory

### ❌ Problem
Command:
`
cd directory_name
`
returns error.

### 🔍 Possible Causes
- Directory does not exist
- Incorrect relative path
- Typo in directory name

### ✅ Resolution

1. Verify directory exists:
```
ls
```

2. Use absolute path:
```
cd ~/lab_practice/documents
```

3. Check spelling carefully.

---

## 📁 Issue 5: Unable to Delete Directory

### ❌ Problem
Running:
`
rm directory_name
`
returns error:
```
Is a directory
```

### 🔍 Cause
`rm` without `-r` cannot remove directories.

### ✅ Resolution

Use recursive option:
```
rm -r directory_name
```

For interactive safety:
```
rm -ri directory_name
```

---

## 📄 Issue 6: Copying Directory Fails

### ❌ Problem
`
cp directory_name backup_directory
`
returns error.

### 🔍 Cause
Recursive flag not used.

### ✅ Resolution

Use:
```
cp -r directory_name backup_directory
```

---

## 🗂 Issue 7: Changes Not Reflected After Editing File

### ❌ Problem
File appears unchanged after editing.

### 🔍 Possible Causes
- File not saved properly
- Editor exited incorrectly

### ✅ Resolution

For nano:
- Press `Ctrl + O`
- Press `Enter`
- Press `Ctrl + X`

For vim:
- Press `Esc`
- Type `:w`
- Press `Enter`
- Then type `:q`

---

## 🔄 Issue 8: diff Shows No Output

### ❌ Problem
Running:
`
diff file1 file2
`
returns no output.

### 🔍 Cause
No differences exist between files.

### ✅ Resolution
This is expected behavior.  
If differences exist, `diff` will display them.

---

## 📊 Issue 9: Incorrect File Count

### ❌ Problem
File count does not match expected number.

### 🔍 Possible Causes
- Hidden files included
- Backup directories counted
- Command not recursive

### ✅ Resolution

Use:
```
find . -type f | wc -l
```

To filter specific extensions:
```
find . -type f -name "*.txt"
```

---

## 📦 Issue 10: Disk Usage Confusion

### ❌ Problem
Disk usage appears higher than expected.

### 🔍 Cause
Recursive directories and backup copies consume additional space.

### ✅ Resolution

Check directory sizes:
```
du -sh *
```

Check total size:
```
du -sh .
```

---

# ✅ Final Validation Checklist

Before marking the lab complete:

- [ ] Directory structure created correctly  
- [ ] Files copied and moved successfully  
- [ ] Backup files verified  
- [ ] Configuration changes compared using diff  
- [ ] Summary file created  
- [ ] File count verified  
- [ ] Disk usage confirmed  

---

## 🎯 Closing Note

Most Linux command-line errors are caused by:

- Incorrect paths
- Permission misconfigurations
- Missing recursive flags
- Editor save mistakes

Careful verification after each operation prevents system-level mistakes in real-world production environments.
