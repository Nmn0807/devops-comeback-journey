y 7 – Linux Revision and Production Health Check

## Objectives

- Revise essential Linux commands.
- Practise Linux user and group management.
- Understand file permissions and ownership.
- Investigate CPU, memory and disk utilization.
- Build a Bash-based server health-check script.
- Understand exit codes and automation.

## 1. Linux System Information

```bash
whoami
hostname
uname -r
uptime
```

## 2. Disk, Memory and CPU Monitoring

```bash
df -h
free -h
ps aux --sort=-%cpu | head -10
ps aux --sort=-%mem | head -10
top
```

## 3. User and Group Management

```bash
sudo groupadd appteam
sudo useradd -m -s /bin/bash appuser
sudo usermod -aG appteam appuser
sudo chown :appteam /opt/company-app
sudo chmod 770 /opt/company-app
```

Verification:

```bash
id appuser
ls -ld /opt/company-app
getent group appteam
```

## 4. Production Process Troubleshooting

Important commands:

```bash
ps aux --sort=-%cpu | head -10
ps aux --sort=-%mem | head -10
top
kill PID
kill -9 PID
sudo lsof +L1
```

Always investigate a process before terminating it. Prefer graceful termination and service-specific restart procedures.

## 5. Bash Project – Server Health Check

Script location:

`bash/scripts/system-health-check.sh`

### Features

- Displays current date and time.
- Identifies the current username.
- Checks root disk utilization.
- Calculates memory utilization.
- Checks Google DNS resolution.
- Determines overall health status.
- Returns an exit code for automation.

### Execute the script

```bash
chmod +x bash/scripts/system-health-check.sh
./bash/scripts/system-health-check.sh
echo $?
```

### Exit code interpretation

- `0`: Health check successful.
- `1`: One or more health checks failed.

### Sample successful output

```text
SERVER HEALTH REPORT

Date & Time: Tue Nov 3 10:30:51 UTC 2026
Username: naman

Root Disk Usage: 1%
PASS: Disk usage is 1%

Memory Usage: 12%
PASS: Memory usage is 12%

DNS Resolution Check:
PASS: Google DNS resolution is working

OVERALL STATUS: HEALTHY
Exit code: 0
```

## 6. Key Learnings

- Linux administration and system monitoring.
- User and group permissions.
- CPU, memory and disk troubleshooting.
- Bash scripting and command substitution.
- Conditional statements and variables.
- DNS resolution checks.
- Exit codes for CI/CD automation.

## Final Outcome

Built a reusable Linux server health-check script that can serve as a foundation for automated infrastructure monitoring and CI/CD validation.

**Day 7 Status: Completed**
