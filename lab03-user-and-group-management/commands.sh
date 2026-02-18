#!/bin/bash
# Lab 03 - User and Group Management
# Commands Executed During Lab

# ================================
# Task 1 – Examine User & Group Info
# ================================

whoami
id
cat /etc/passwd
cat /etc/group
sudo cat /etc/shadow
head -5 /etc/passwd
echo "Format: username:password:UID:GID:GECOS:home_directory:shell"
head -5 /etc/group
echo "Format: group_name:password:GID:user_list"

# ================================
# Task 2 – User Management
# ================================

sudo useradd john
grep john /etc/passwd
id john

sudo useradd -m -s /bin/bash -c "Jane Smith" -G users jane
grep jane /etc/passwd
id jane

sudo useradd -m -d /home/custom_mike -s /bin/bash mike
grep mike /etc/passwd

sudo passwd john
sudo passwd jane
sudo passwd mike

sudo useradd -r -s /bin/false serviceuser
id serviceuser

sudo usermod -s /bin/zsh john
grep john /etc/passwd

sudo usermod -d /home/john_new -m john
ls -la /home/ | grep john

sudo usermod -c "John Doe - Developer" john
grep john /etc/passwd

sudo usermod -L mike
sudo passwd -S mike

sudo usermod -U mike
sudo passwd -S mike

sudo usermod -u 1500 jane
id jane

sudo userdel serviceuser
grep serviceuser /etc/passwd || echo "User serviceuser deleted"

sudo userdel -r mike
ls /home/ | grep mike || echo "Mike's home directory removed"

sudo userdel -f john 2>/dev/null || echo "User john deleted or not found"
id john 2>/dev/null || echo "User john deleted successfully"

# ================================
# Task 3 – Group Management
# ================================

sudo groupadd developers
grep developers /etc/group
getent group developers

sudo groupadd -g 2000 managers
sudo groupadd -r systemgroup
grep -E "(developers|managers|systemgroup)" /etc/group

sudo usermod -aG developers jane
groups jane
id jane

sudo usermod -aG managers,users jane
groups jane

sudo useradd -m -G developers,users alice
groups alice

sudo usermod -g developers alice
id alice

sudo groupadd project_alpha
sudo useradd -m -G project_alpha bob
sudo useradd -m -G project_alpha carol
getent group project_alpha

sudo gpasswd -d jane managers
groups jane

sudo gpasswd -a jane managers
groups jane

sudo groupdel developers || echo "Cannot delete primary group"

sudo usermod -g users alice
sudo groupdel developers

sudo groupdel systemgroup
sudo groupdel project_alpha
grep -E "(systemgroup|project_alpha)" /etc/group || echo "Groups successfully deleted"

# ================================
# Task 4 – Practical Scenario
# ================================

sudo groupadd webdev
sudo groupadd database
sudo groupadd devops
grep -E "(webdev|database|devops)" /etc/group

sudo useradd -m -G webdev,users -s /bin/bash sarah
sudo useradd -m -G database,users -s /bin/bash david
sudo useradd -m -G devops,users -s /bin/bash lisa

groups sarah
groups david
groups lisa

echo "Setting passwords for team members..."
sudo passwd sarah
sudo passwd david
sudo passwd lisa

sudo mkdir -p /opt/projects
sudo chgrp webdev /opt/projects
sudo chmod 775 /opt/projects
ls -ld /opt/projects

sudo chage -M 90 -m 7 -W 14 sarah
sudo chage -l sarah

sudo usermod -e 2024-12-31 david
sudo chage -l david

# ================================
# Task 4.3 – Bulk Operations
# ================================

nano create_users.sh
chmod +x create_users.sh
./create_users.sh
grep -E "(intern1|intern2|intern3)" /etc/passwd

for user in intern1 intern2 intern3; do
  echo "$user:temp123" | sudo chpasswd
  sudo chage -d 0 "$user"
done

sudo chage -l intern1

# ================================
# Task 5 – Security Checks
# ================================

sudo awk -F: '($2 == "") {print $1}' /etc/shadow
awk -F: '($3 == 0) {print $1}' /etc/passwd
grep -E "(bash|zsh|sh)$" /etc/passwd
cut -d: -f3 /etc/passwd | sort | uniq -d

lastlog | head -10
lastlog | grep -E "(toor|jane|sarah)"
who
w
last | head -10
sudo grep "Failed password" /var/log/auth.log | tail -5 || echo "No recent failed attempts"

# ================================
# Task 6 – Cleanup
# ================================

for user in alice bob carol sarah david lisa intern1 intern2 intern3; do
  sudo userdel -r "$user" 2>/dev/null && echo "Removed user: $user"
done

for group in webdev database devops managers; do
  sudo groupdel "$group" 2>/dev/null && echo "Removed group: $group"
done

rm -f create_users.sh
sudo rm -rf /opt/projects

echo "Current users with login shells:"
grep -E "(bash|zsh|sh)$" /etc/passwd | cut -d: -f1

echo "Custom groups (GID > 1000):"
awk -F: '($3 > 1000) {print $1}' /etc/group

id jane 2>/dev/null && echo "Jane user exists" || echo "Jane user removed"
