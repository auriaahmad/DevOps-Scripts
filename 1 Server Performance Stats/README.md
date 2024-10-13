# Request to Follow and Star the Repository. Thanks :)

# Server Performance Stats Script

This script (`server-stats.sh`) provides basic server performance statistics on any Linux-based system. It includes CPU, memory, and disk usage stats, as well as information about the top processes by resource usage and other useful system details.

## Features

- **Total CPU usage**: Displays the current CPU usage as a percentage.
- **Memory usage**: Shows the amount of used and free memory along with the percentage of memory in use.
- **Disk usage**: Reports the used and free disk space, including the percentage in use for the root filesystem.
- **Top 5 CPU-consuming processes**: Lists the top 5 processes by CPU usage.
- **Top 5 memory-consuming processes**: Lists the top 5 processes by memory usage.
- **OS Version**: Provides the operating system version.
- **System Uptime**: Displays how long the system has been running.
- **Load Average**: Shows the system load averages for the past 1, 5, and 15 minutes.
- **Logged In Users**: Displays a list of users currently logged into the server.
- **Failed Login Attempts**: Lists the most recent failed login attempts.

## Requirements

- A Linux-based system (e.g., Ubuntu, CentOS)
- `bash` shell
- Optional: Root privileges to view failed login attempts

## Installation and Usage

Follow these steps to create, install, and run the script on your server.

### 1. Log into Your Server

```bash
ssh username@your-server-ip
```

### 2. Create the Script Using Nano

Navigate to the directory where you want to create the script (e.g., your home directory):

```bash
cd ~
```

Create a new script file using `nano`:

```bash
nano server-stats.sh
```

### 3. Copy and Paste the Script Content

Paste the following script into the `nano` editor:

```bash
#!/bin/bash

echo "Server Performance Stats"
echo "========================"

# Total CPU usage
echo -n "Total CPU Usage: "
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{printf "%.2f%%\n", 100 - $1}'

# Total memory usage (Free vs Used including percentage)
echo "Total Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%), Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2 }'

# Total disk usage (Free vs Used including percentage)
echo "Total Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %s (%s), Free: %s\n", $3, $5, $4}'

# Top 5 processes by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

# OS Version
echo "OS Version:"
lsb_release -a 2>/dev/null || cat /etc/*release

# Uptime
echo "Uptime:"
uptime -p

# Load average
echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

# Logged in users
echo "Logged In Users:"
who

# Failed login attempts (requires root privileges)
echo "Failed Login Attempts:"
sudo lastb | head -n 5
```

### 4. Save and Exit Nano

- Press `Ctrl + X` to exit `nano`.
- When prompted to save changes, type `Y` and press `Enter` to confirm the file name.

### 5. Make the Script Executable

```bash
chmod +x server-stats.sh
```

### 6. Run the Script

```bash
./server-stats.sh
```

### Optional: Move the Script to a Global Location

To run the script from any directory, move it to a folder in your system's `$PATH`:

```bash
sudo mv server-stats.sh /usr/local/bin/
```

Now you can run it from anywhere using:

```bash
server-stats.sh
```

## Automate with Cron (Optional)

To run the script automatically at regular intervals, use a cron job:

1. Open the cron job editor:

   ```bash
   crontab -e
   ```

2. Add the following line to run the script every hour:

   ```
   0 * * * * /usr/local/bin/server-stats.sh
   ```

3. Save and exit the editor.

## Notes

- **Failed Login Attempts**: Viewing failed login attempts requires root privileges. When running the script, you'll be prompted for your password if `sudo` is used.
- **Compatibility**: The script uses common Linux utilities and should work on most distributions. Adjustments may be needed for non-standard setups.

## License

This project is licensed under the MIT License.
---