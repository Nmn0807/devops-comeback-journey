#!/bin/bash

echo "================================"
echo "       DISK HEALTH CHECK"
echo "================================"

disk_usage=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root disk usage: ${disk_usage}%"

if [ "$disk_usage" -ge 80 ]; then
	    echo "WARNING: Disk usage is HIGH!"
    elif [ "$disk_usage" -ge 60 ]; then
	        echo "NOTICE: Disk usage is getting high."
	else
		    echo "STATUS: Disk usage is NORMAL."
fi

echo "================================"
