#!/bin/bash

echo "Server Performance Stats"
echo "========================"

# Total CPU usage
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

# Total memory usage (Free vs Used including percentage)
echo "Total Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2 }'

# Total disk usage (Free vs Used including percentage)
echo "Total Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %dGB (%.2f%%), Free: %dGB\n", $3, $5, $4}'

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

# OS version
echo "OS Version:"
lsb_release -a

# Uptime
echo "Uptime:"
uptime -p

# Load average
echo "Load Average:"
uptime | awk '{print $9, $10, $11}'

# Logged in users
echo "Logged In Users:"
who

# Failed login attempts
echo "Failed Login Attempts:"
lastb | head -n 5