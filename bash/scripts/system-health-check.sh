#!/bin/bash

# Server Health Check Script

 echo "=================================="
 echo "       SERVER HEALTH REPORT"
 echo "=================================="

 # Overall health status
 health="HEALTHY"

 # 1. Current date and time
 echo "Date & Time : $(date)"

 # 2. Current username
 echo "Username    : $(whoami)"

 # 3. Root disk usage
 echo ""
 echo "Root Disk Usage:"
 disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
 df -h / | awk 'NR==1 || NR==2'

 if [ "$disk_usage" -ge 80 ]; then
     echo "WARNING: Root disk usage is ${disk_usage}%"
         health="UNHEALTHY"
         else
             echo "PASS: Disk usage is ${disk_usage}%"
             fi

             # 4. Memory usage
             echo ""
             echo "Memory Usage:"
             free -h

             memory_usage=$(free | awk '/Mem:/ {printf "%.0f", (($2-$7)/$2)*100}')

             if [ "$memory_usage" -ge 80 ]; then
                 echo "WARNING: Memory usage is ${memory_usage}%"
                     health="UNHEALTHY"
                     else
                         echo "PASS: Memory usage is ${memory_usage}%"
                         fi

                         # 5. Google DNS resolution check
                         echo ""
                         echo "DNS Resolution Check:"

                         if getent hosts google.com > /dev/null 2>&1; then
                             echo "PASS: Google DNS resolution is working"
                             else
                                 echo "FAIL: Google DNS resolution is not working"
                                     health="UNHEALTHY"
                                     fi

                                     # 6. Overall health status
                                     echo ""
                                     echo "=================================="

                                     if [ "$health" = "HEALTHY" ]; then
                                         echo "OVERALL STATUS: HEALTHY"
                                         else
                                             echo "OVERALL STATUS: UNHEALTHY"
                                             fi

                                             if [ "$health" = "HEALTHY" ]; then
                                                 exit 0
                                                 else
                                                     exit 1
                                                     fi 

                                                     echo "=================================="
