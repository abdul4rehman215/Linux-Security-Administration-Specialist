#!/bin/bash
# Lab 02 - Shell Scripting Basics
# Commands Executed During Lab

# ================================
# Environment Preparation
# ================================

mkdir ~/shell_scripts
cd ~/shell_scripts
pwd

# ================================
# Task 1 – Script Fundamentals
# ================================

# Create hello world script
nano hello_world.sh
chmod +x hello_world.sh
./hello_world.sh

# Create variables demo script
nano variables_demo.sh
chmod +x variables_demo.sh
./variables_demo.sh

# Create conditions demo script
nano conditions_demo.sh
chmod +x conditions_demo.sh
./conditions_demo.sh
./conditions_demo.sh
./conditions_demo.sh

# Create number checker script
nano number_checker.sh
chmod +x number_checker.sh
./number_checker.sh
./number_checker.sh
./number_checker.sh

# ================================
# Task 2 – Loop Implementation
# ================================

# Create for loop script
nano for_loop_demo.sh
chmod +x for_loop_demo.sh
./for_loop_demo.sh

# Create while loop script
nano while_loop_demo.sh
chmod +x while_loop_demo.sh
./while_loop_demo.sh

# Create nested loops script
nano nested_loops.sh
chmod +x nested_loops.sh
./nested_loops.sh

# ================================
# Task 3 – Automation Projects
# ================================

# Create system information script
nano system_info.sh
chmod +x system_info.sh
./system_info.sh
ls -la system_report_*.txt
cat system_report_*.txt

# Create file management automation script
nano file_manager.sh
chmod +x file_manager.sh
./file_manager.sh

# Create backup automation script
nano backup_automation.sh
chmod +x backup_automation.sh
./backup_automation.sh
ls -la ~/backups/

# ================================
# Verification & Debugging Commands
# ================================

which bash
echo $?
pwd
ls -la
