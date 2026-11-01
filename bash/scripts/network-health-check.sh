#!/bin/bash

echo "=================================="
echo "       NETWORK HEALTH CHECK"
echo "=================================="

echo
echo "[1] Network Interfaces"
ip -brief addr

echo
echo "[2] Default Route"
if ip route | grep -q "^default"; then
	    echo "Default route: CONFIGURED"
    else
	        echo "Default route: NOT FOUND"
fi

echo
echo "[3] DNS Resolution"
if getent hosts github.com > /dev/null; then
	    echo "DNS: WORKING"
    else
	        echo "DNS: FAILED"
fi

echo
echo "[4] HTTPS Connectivity"
if curl -fsSI --connect-timeout 10 https://github.com > /dev/null; then
	    echo "HTTPS: WORKING"
    else
	        echo "HTTPS: FAILED"
fi

echo
echo "[5] Listening Ports"
ss -tuln

echo
echo "=================================="
echo "       CHECK COMPLETED"
echo "=================================="
