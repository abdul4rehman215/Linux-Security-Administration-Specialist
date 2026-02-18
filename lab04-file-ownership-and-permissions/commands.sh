#!/bin/bash
# Lab 04 - File Ownership and Permissions
# Commands Executed

# ==============================
# Lab Environment Setup
# ==============================

mkdir ~/lab4_permissions
cd ~/lab4_permissions

touch file1.txt file2.txt secret.txt
mkdir testdir1 testdir2

echo "This is a test file" > file1.txt
echo "Confidential data" > secret.txt

nano test_script.sh

ls -la

# ==============================
# Task 1 - chmod Operations
# ==============================

ls -l
stat -c "%a %n" *

echo "Permission format explanation:"
echo "drwxrwxrwx = directory with full permissions"
echo "-rw-r--r-- = regular file with read/write for owner, read for group and others"

chmod u+x test_script.sh
chmod go-w file1.txt
chmod u=rw,g=r,o=r file2.txt
chmod a+rx testdir1

ls -l

chmod 755 test_script.sh
chmod 644 file1.txt
chmod 600 secret.txt
chmod 777 testdir2

ls -l
stat -c "%a %n" *

mkdir -p testdir1/subdir1/subdir2
touch testdir1/file_in_dir.txt
touch testdir1/subdir1/nested_file.txt

chmod -R 755 testdir1
find testdir1 -exec ls -ld {} \;

# ==============================
# Task 2 - chown & chgrp
# ==============================

ls -l
ls -n
whoami
groups
id

sudo groupadd testgroup
sudo usermod -a -G testgroup $USER
groups $USER

sudo chown :testgroup file1.txt
sudo chown $USER:testgroup file2.txt
sudo chown -R $USER:testgroup testdir1

ls -l
ls -ld testdir1

sudo chgrp testgroup secret.txt
sudo chgrp -R testgroup testdir2

ls -l

# ==============================
# Task 3 - umask
# ==============================

umask
umask -S

touch umask_test1.txt
ls -l umask_test1.txt

umask 077
touch umask_test2.txt
ls -l umask_test2.txt

umask 022
touch umask_test3.txt
ls -l umask_test3.txt

echo "Comparing files created with different umask values:"
ls -l umask_test*.txt

echo "Current umask in .bashrc:"
grep -n umask ~/.bashrc || echo "No umask found in .bashrc"

cp ~/.bashrc ~/.bashrc.backup
echo "" >> ~/.bashrc
echo "# Custom umask setting for lab" >> ~/.bashrc
echo "umask 027" >> ~/.bashrc

tail -3 ~/.bashrc

# ==============================
# Task 3 - ACL Operations
# ==============================

getfacl --version

touch acl_test1.txt acl_test2.txt
echo "ACL test content" > acl_test1.txt

getfacl acl_test1.txt

setfacl -m u:$USER:rw acl_test1.txt
setfacl -m g:testgroup:r acl_test1.txt

mkdir acl_testdir
setfacl -d -m u:$USER:rwx acl_testdir
setfacl -d -m g:testgroup:rx acl_testdir

getfacl acl_test1.txt
getfacl acl_testdir

touch acl_testdir/inherited_file.txt
getfacl acl_testdir/inherited_file.txt

setfacl -x u:$USER acl_test1.txt
getfacl acl_test1.txt

setfacl -b acl_test2.txt
getfacl acl_test2.txt

setfacl -m u:$USER:rw acl_test2.txt
getfacl acl_test2.txt

getfacl acl_test2.txt | setfacl --set-file=- acl_test1.txt
getfacl acl_test1.txt
getfacl acl_test2.txt

setfacl -m m:r acl_test1.txt
getfacl acl_test1.txt

# ==============================
# Practical Scenario 1 - Web Server
# ==============================

mkdir -p ~/webserver/{public_html,logs,config}
touch ~/webserver/public_html/index.html
touch ~/webserver/logs/access.log
touch ~/webserver/config/server.conf

chmod 755 ~/webserver
chmod 755 ~/webserver/public_html
chmod 644 ~/webserver/public_html/index.html
chmod 755 ~/webserver/logs
chmod 644 ~/webserver/logs/access.log
chmod 700 ~/webserver/config
chmod 600 ~/webserver/config/server.conf

find ~/webserver -exec ls -ld {} \;

# ==============================
# Practical Scenario 2 - Shared Directory
# ==============================

mkdir ~/shared_project
chmod 775 ~/shared_project
sudo chgrp testgroup ~/shared_project
chmod +t ~/shared_project
chmod g+s ~/shared_project

ls -ld ~/shared_project

touch ~/shared_project/team_file.txt
ls -l ~/shared_project/

# ==============================
# Troubleshooting & Auditing
# ==============================

find ~/lab4_permissions -perm 644
find ~/lab4_permissions -user $USER
find ~/lab4_permissions -perm /6000
find ~/lab4_permissions -nouser -o -nogroup
find ~/lab4_permissions -exec getfacl {} \; 2>/dev/null | grep -l "user::"

# ==============================
# Verification Script
# ==============================

nano permission_test.sh
chmod +x permission_test.sh
./permission_test.sh

cat << 'EOF'
=== Lab 4 Summary ===
EOF
