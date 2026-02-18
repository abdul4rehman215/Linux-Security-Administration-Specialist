#!/bin/bash

# ==============================
# Lab 9: Networking Basics & Tools
# Commands Executed During Lab
# ==============================


# --------------------------------
# Install Required Tools
# --------------------------------
ifconfig
sudo apt update
sudo apt install net-tools -y
sudo apt install traceroute -y
sudo apt install netcat -y
sudo apt install iftop -y


# --------------------------------
# Network Interface Management
# --------------------------------
ifconfig
ifconfig -a
ifconfig eth0
ifconfig eth0 | grep -E "(RX|TX)"

ip link show
ip addr show
ip route show
ip -s link show
ip -4 addr show


# --------------------------------
# Network Comparison Script
# --------------------------------
nano network_comparison.sh
chmod +x network_comparison.sh
./network_comparison.sh


# --------------------------------
# Network Connection Analysis
# --------------------------------
netstat -a
netstat -l
sudo netstat -tlnp
sudo netstat -ulnp
netstat -rn

ss -a
ss -l
sudo ss -tlnp
sudo ss -ulnp
ss -s


# --------------------------------
# Network Monitoring Script
# --------------------------------
nano network_monitor.sh
chmod +x network_monitor.sh
./network_monitor.sh


# --------------------------------
# View Network Configuration
# --------------------------------
ip addr show
ip route show
cat /etc/resolv.conf


# --------------------------------
# Temporary IP Configuration
# --------------------------------
sudo ip addr add 192.168.100.10/24 dev eth0
ip addr show eth0
sudo ip addr del 192.168.100.10/24 dev eth0
ip addr show eth0


# --------------------------------
# Interface State Management
# --------------------------------
ip link show eth0
sudo ip link set eth0 down
sudo ip link set eth0 up
ip link show eth0


# --------------------------------
# Connectivity Testing
# --------------------------------
ping -c 4 127.0.0.1
ping -c 4 $(ip route show default | awk '{print $3}')
ping -c 4 8.8.8.8
ping -c 4 google.com
ping -D google.com

traceroute google.com
traceroute -n google.com
traceroute $(ip route show default | awk '{print $3}')


# --------------------------------
# Connectivity Test Script
# --------------------------------
nano connectivity_test.sh
chmod +x connectivity_test.sh
./connectivity_test.sh


# --------------------------------
# Port & Service Detection
# --------------------------------
ss -tlnp | grep LISTEN
ss -tlnp | grep :22
ss -tlnp | grep :80
ss -tlnp | grep :443
nc -zv localhost 22


# --------------------------------
# Network Statistics Monitoring
# --------------------------------
watch -n 2 'cat /proc/net/dev'
ip -s link show
watch -n 2 'ss -tuln | head -10'


# --------------------------------
# Network Diagnostic Script
# --------------------------------
nano network_diagnostic.sh
chmod +x network_diagnostic.sh
./network_diagnostic.sh
