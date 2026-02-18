# ==============================
# Task 1: Generate SSH Key Pair
# ==============================

ls -la ~/.ssh/

ssh-keygen -t rsa -b 4096 -C "student@example.com"

ls -la ~/.ssh/

# ==============================
# Create Test User
# ==============================

sudo useradd -m -s /bin/bash testuser
sudo passwd testuser

sudo su - testuser

mkdir -p ~/.ssh
chmod 700 ~/.ssh

exit

sudo cp ~/.ssh/id_rsa.pub /home/testuser/.ssh/authorized_keys
sudo chown testuser:testuser /home/testuser/.ssh/authorized_keys
sudo chmod 600 /home/testuser/.ssh/authorized_keys

ls -la /home/testuser/.ssh/

# ==============================
# Test Key-Based Authentication
# ==============================

ssh -i ~/.ssh/id_rsa testuser@localhost
exit

# ==============================
# SSH Hardening
# ==============================

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

sudo grep -E "^[^#]" /etc/ssh/sshd_config

sudo nano /etc/ssh/sshd_config

sudo /usr/sbin/sshd -t

sudo systemctl restart ssh

sudo systemctl status ssh

sudo ss -tlnp | grep :2222

# ==============================
# Test Hardened SSH
# ==============================

ssh -p 2222 -i ~/.ssh/id_rsa testuser@localhost

ssh -p 2222 root@localhost

# ==============================
# SSH Agent Setup
# ==============================

eval "$(ssh-agent -s)"

echo $SSH_AGENT_PID

ps aux | grep ssh-agent

ssh-add ~/.ssh/id_rsa

ssh-add -l

ssh -p 2222 testuser@localhost
exit

# ==============================
# SSH Agent Startup Script
# ==============================

nano ~/.ssh/ssh-agent-startup.sh

chmod +x ~/.ssh/ssh-agent-startup.sh

echo "source ~/.ssh/ssh-agent-startup.sh" >> ~/.bashrc

tail -1 ~/.bashrc

# ==============================
# Advanced Key Management
# ==============================

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_github -C "github_key"

ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_server -C "server_key"

nano ~/.ssh/config

chmod 600 ~/.ssh/config

ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/id_ed25519_github
ssh-add ~/.ssh/id_rsa_server

ssh-add -l

ssh localhost

ssh-add -d ~/.ssh/id_ed25519_github

ssh-add -D

# ==============================
# Verification
# ==============================

sudo /usr/sbin/sshd -T | grep -E "(permitrootlogin|passwordauthentication|port|maxauthtries)"

sudo systemctl status ssh

sudo ss -tlnp | grep :2222

ssh -p 2222 root@localhost

ssh -p 2222 testuser@localhost

ssh-add -l

echo $SSH_AGENT_PID

# ==============================
# Troubleshooting Commands
# ==============================

ls -la ~/.ssh/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/authorized_keys

pkill ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

sudo netstat -tlnp | grep :2222
sudo ufw status
sudo ufw allow 2222/tcp
sudo systemctl restart sshd

sudo sshd -t
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config
