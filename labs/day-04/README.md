# Day 4 – Linux Process Management, Services, Logs & Permissions

## Objectives

Learn Linux system administration and troubleshooting skills used in real-world DevOps environments.

## 1. Process Management

Commands practised:

```bash
ps aux
top
ps aux | grep bash
ps aux --sort=-%cpu | head -10
ps aux --sort=-%mem | head -10
```

Key learnings:
- PID identifies a running process.
- `ps aux` displays a snapshot of running processes.
- `top` continuously monitors processes and resource usage.
- `kill` sends a signal to a process.
- `kill -15` requests graceful termination.
- `kill -9` forcefully terminates a process.

## 2. CPU and Memory Troubleshooting

Commands practised:

```bash
top
free -h
lscpu
```

Simulated CPU saturation using:

```bash
yes > /dev/null
```

Identified the high-CPU process using `top` and `ps`, then stopped it with Ctrl+C.

## 3. Service Management with systemd

Commands practised:

```bash
systemctl status cron
systemctl start cron
systemctl stop cron
systemctl restart cron
systemctl enable cron
systemctl list-unit-files
```

Key learnings:
- `systemctl` manages systemd services.
- `start`, `stop`, and `restart` manage service runtime state.
- `enable` configures a service to start automatically at boot.

## 4. Linux Logs

Commands practised:

```bash
ls -lah /var/log/
journalctl -n 20
journalctl -p err -n 20
journalctl -u cron -n 10
journalctl -f
tail -n 10 /var/log/syslog
tail -f /var/log/syslog
```

Key learnings:
- `/var/log/` contains Linux system and application logs.
- `journalctl` reads the systemd journal.
- `-u` filters logs by service.
- `-f` follows new log entries.
- Logs help identify application and service failures.

## 5. File Permissions and Ownership

Commands practised:

```bash
ls -l
chmod 755 deploy.sh
chmod 644 test.txt
chown user:group filename
whoami
id
groups
```

Permission values:

| Permission | Numeric value |
|---|---:|
| Read | 4 |
| Write | 2 |
| Execute | 1 |

Common permission configurations:

- `755`: Owner has full permissions; group and others can read and execute.
- `644`: Owner can read and write; group and others can read.

Key learnings:
- `chmod` changes file permissions.
- `chown` changes file ownership.
- Correct permissions are important for secure deployments.

## 6. Production Troubleshooting Simulation

Simulated a Jenkins deployment failure:

```text
Permission denied: ./deploy.sh
```

Troubleshooting procedure:

1. Inspect file permissions using `ls -l deploy.sh`.
2. Identify missing execute permission.
3. Apply `chmod 755 deploy.sh`.
4. Verify permissions again.
5. Execute the script to confirm successful deployment.

## DevOps Relevance

These skills are useful for:

- Troubleshooting high CPU and memory usage.
- Managing Linux services.
- Investigating production failures through logs.
- Fixing Jenkins deployment permission errors.
- Maintaining secure file permissions.

## Day 4 Status

Completed Linux process management, service management, log analysis, file permissions, and production troubleshooting fundamentals.
