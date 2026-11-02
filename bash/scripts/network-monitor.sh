#!/bin/bash

overall_status=0

echo "================================"
echo "       NETWORK MONITOR"
echo "================================"

# Check network interface
 if ip -br link | grep -q "UP"; then
     echo "Network interface: UP"
     else
         echo "Network interface: DOWN"
             overall_status=1
             fi

             # Check default gateway
             if ip route | grep -q "^default"; then
                 echo "Default gateway: AVAILABLE"
                 else
                     echo "Default gateway: MISSING"
                         overall_status=1
                         fi

                         # Check DNS resolution
                         if getent hosts github.com > /dev/null; then
                             echo "DNS resolution: WORKING"
                             else
                                 echo "DNS resolution: FAILED"
                                     overall_status=1
                                     fi

                                     # Check HTTPS connectivity
                                     if curl -s --connect-timeout 5 https://github.com > /dev/null; then
                                         echo "HTTPS connectivity: WORKING"
                                         else
                                             echo "HTTPS connectivity: FAILED"
                                                 overall_status=1
                                                 fi

                                                 echo "================================"

                                                 if [ "$overall_status" -eq 0 ]; then
                                                     echo "OVERALL STATUS: HEALTHY"
                                                     else
                                                         echo "OVERALL STATUS: UNHEALTHY"
                                                         fi

                                                         echo "================================"

                                                        exit "$overall_status"
