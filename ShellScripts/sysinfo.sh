#!/bin/bash

# Author: Himanshu Yadav
# Purpose: Generate a system information report

echo "=========================================="
echo "       SYSTEM INFORMATION REPORT"
echo "=========================================="

echo "Author: Himanshu Yadav"
echo "Roll Number: 2601010068"
echo "Date: $(date)"
echo

echo "----------- CPU INFORMATION -------------"

CPU_MODEL=$(lscpu | grep "Model name" | head -1 | cut -d ':' -f2)
CPU_CORES=$(nproc)

echo "CPU Model: $CPU_MODEL"
echo "CPU Cores: $CPU_CORES"
echo

echo "----------- MEMORY INFORMATION ----------"

free -h | awk '
/^Mem:/ {
    print "Total Memory: " $2
    print "Used Memory: " $3
}'

echo

echo "----------- TOP 3 PROCESSES -------------"

ps aux --sort=-%cpu | head -4

echo
echo "=========================================="
echo "Report generated successfully."
echo "=========================================="
