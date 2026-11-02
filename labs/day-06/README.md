# Day 6 – Linux User Management, Package Management & System Troubleshooting

## Objectives

- Understand Linux users, groups and permissions.
- Create and manage users and groups.
- Understand APT package management.
- Investigate disk, memory and CPU utilization.
- Troubleshoot production disk-space issues.
- Understand deleted files held open by running processes.

---

## 1. Linux User and Group Management

### Identify the current user

```bash
whoami
id
groups
```

### Important Linux files

| File | Purpose |
|---|---|
| `/etc/passwd` | Stores user account information |
| `/etc/group` | Stores group information |
| `/etc/shadow` | Stores password hashes and password-related information |

### Create a group and user

```bash
sudo groupadd devops-team
sudo useradd -m -s /bin/bash deployuser
sudo usermod -aG devops-team deployuser
```

### Verify user and group membership

```bash
id deployuser
groups deployuser
getent group devops-team
ls -ld /home/deployuser
```

### Important concepts

- UID: Unique user ID.
- GID: Primary group ID.
- Supplementary groups: Additional groups a user belongs to.
- `usermod -aG`: Adds a supplementary group without removing existing memberships.
- `usermod -G`: Replaces supplementary group memberships. Use carefully.
- Principle of least privilege: Give users only the permissions they need.

---

## 2. Linux Permissions

Linux permissions use three categories:

- Owner
- Group
- Others

Permission values:

| Permission | Numeric value |
|---|---:|
| Read (r) | 4 |
| Write (w) | 2 |
| Execute (x) | 1 |

Examples:

```bash
chmod 755 script.sh
chmod 644 file.txt
ls -l script.sh
```

- `755`: Owner gets read, write and execute; group and others get read and execute.
- `644`: Owner gets read and write; group and others get read only.

Commands:

```bash
chmod
chown
```

`chmod` changes permissions, while `chown` changes file ownership.

---

## 3. APT Package Management

APT is the package-management tool used by Ubuntu and other Debian-based distributions.

Check installed Git version:

```bash
git --version
```

Check installed package information:

```bash
apt list --installed | grep "^git/"
```

Refresh package indexes:

```bash
sudo apt update
```

Upgrade installed packages:

```bash
sudo apt upgrade
```

### Important difference

- `apt update`: Refreshes package information from configured repositories.
- `apt upgrade`: Installs available upgrades for installed packages.

**Production consideration:** Package upgrades should follow change-management procedures and be performed during approved maintenance windows when required.

---

## 4. Disk Utilization Troubleshooting

Check filesystem usage:

```bash
df -h
```

Check a specific filesystem:

```bash
df -h /
```

Check directory sizes:

```bash
du -sh ~/devops-comeback-journey/
du -sh ~/devops-comeback-journey/*
```

Find large directories at the filesystem root:

```bash
sudo du -xhd1 / 2>/dev/null | sort -h
```

Find large log directories:

```bash
sudo du -sh /var/log/* 2>/dev/null | sort -h
```

### Difference between df and du

- `df`: Reports filesystem-level disk usage.
- `du`: Reports disk space used by files and directories.

---

## 5. Memory Troubleshooting

Check overall memory utilization:

```bash
free -h
```

Identify processes consuming the most memory:

```bash
ps aux --sort=-%mem | head -10
```

**Important:** The `available` memory value from `free -h` is generally more useful than looking only at `free` memory.

---

## 6. CPU Troubleshooting

Identify processes consuming the most CPU:

```bash
ps aux --sort=-%cpu | head -10
```

Monitor processes continuously:

```bash
top
```

- `ps`: Provides a snapshot of processes.
- `top`: Provides continuously refreshed process information.

---

## 7. Production Troubleshooting Scenario – High Disk Usage

### Scenario

A production server reports 95% disk utilization.

The application team reports that log files are consuming too much disk space.

### Investigation commands

Check filesystem utilization:

```bash
df -h
```

Check log directory size:

```bash
sudo du -sh /var/log
```

Inspect a suspicious log file:

```bash
sudo ls -lh /var/log/application.log
sudo tail -100 /var/log/application.log
```

Check which process has the file open:

```bash
sudo lsof /var/log/application.log
```

Inspect log rotation configuration:

```bash
cat /etc/logrotate.conf
ls -lah /etc/logrotate.d/
```

### Deleted files still consuming disk space

Sometimes a process continues holding a deleted log file open.

Find deleted files held open by running processes:

```bash
sudo lsof +L1
```

**Why does this happen?**

1. `rm` removes the filename from the directory.
2. A running process may still hold the file open.
3. The file's disk space is not reclaimed while that open reference remains.
4. Once the process closes the file descriptor and no other references remain, the space can be reclaimed.

**Important:** Do not blindly kill the process. Identify the application and follow its supported log-reopen or restart procedure.

Verify disk utilization again:

```bash
df -h
```

---

## 8. Production Resource Troubleshooting Workflow

| Resource | First command | Further investigation |
|---|---|---|
| Disk | `df -h` | `du -xhd1 /` |
| Memory | `free -h` | `ps aux --sort=-%mem` |
| CPU | `top` | `ps aux --sort=-%cpu` |

### My troubleshooting approach

When a production server experiences resource issues:

1. Identify which resource is under pressure.
2. Find the affected filesystem or resource.
3. Identify the processes or directories responsible.
4. Inspect logs and application behavior.
5. Apply a controlled corrective action.
6. Verify that the issue is resolved.
7. Document the root cause and preventive measures.

---

## Key Learnings

- Linux user and group management.
- User IDs, group IDs and supplementary groups.
- Linux file permissions and ownership.
- APT package management.
- Disk, memory and CPU investigation.
- Difference between `df` and `du`.
- Process investigation using `ps`, `top` and `lsof`.
- Production log troubleshooting.
- Understanding deleted files held open by processes.

**Day 6 Status: Completed**
