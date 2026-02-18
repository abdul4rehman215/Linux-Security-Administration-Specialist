#!/bin/bash
# Lab 01 – Linux Command Line Foundations
# Commands Executed During Lab

# ----------------------------
# Task 1: Directory Navigation
# ----------------------------

pwd
ls
ls -l
ls -la

cd /
pwd
ls -l

cd /home
ls -l

cd ~
pwd

mkdir lab_practice
ls -l

cd lab_practice
mkdir documents images scripts
ls -l

cd documents
cd ..
cd ~/lab_practice/documents

# ----------------------------
# Task 2: File Management
# ----------------------------

cd ~/lab_practice
touch sample.txt
touch file1.txt file2.txt file3.txt
ls -l

cp sample.txt sample_backup.txt
cp sample.txt documents/
cp file1.txt file2.txt file3.txt documents/
ls -l documents/

cp -r documents documents_backup
ls -l documents_backup/

touch move_test.txt
mv move_test.txt images/
ls -l images/

mv sample_backup.txt renamed_sample.txt
ls -l

mv renamed_sample.txt scripts/final_sample.txt
ls -l scripts/

touch temp1.txt temp2.txt temp3.txt
mv temp1.txt temp2.txt temp3.txt images/
ls -l images/

touch delete_me.txt another_delete.txt
rm delete_me.txt
ls -l

rm another_delete.txt file1.txt

mkdir temp_directory
touch temp_directory/temp_file1.txt temp_directory/temp_file2.txt
rm -r temp_directory

touch careful_delete.txt
rm -i careful_delete.txt

# ----------------------------
# Task 3: Text Editing
# ----------------------------

cd ~/lab_practice/documents
nano my_first_file.txt
cat my_first_file.txt

nano my_first_file.txt
cat my_first_file.txt

vim advanced_file.txt
cat advanced_file.txt

vim advanced_file.txt
cat advanced_file.txt

nano system_config.txt
cp system_config.txt system_config_backup.txt

vim system_config.txt
diff system_config.txt system_config_backup.txt

# ----------------------------
# Verification & Summary
# ----------------------------

cd ~/lab_practice
find . -type f -name "*.txt" | head -10
find . -type f | wc -l
du -sh .

nano lab_summary.txt
cat lab_summary.txt
