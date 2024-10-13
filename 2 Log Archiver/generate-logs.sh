#!/bin/bash

# Script to generate test logs in /var/log/test_logs directory
LOG_DIR="/var/log/test_logs"
mkdir -p $LOG_DIR

# Generate dummy log files
for i in {1..5}; do
    echo "Log entry $i - $(date)" > $LOG_DIR/log_$i.log
done

echo "Generated test logs in $LOG_DIR"