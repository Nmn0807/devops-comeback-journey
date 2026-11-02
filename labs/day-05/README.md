# Day 5 – Networking and SSH Fundamentals

## Topics Covered

1. DNS resolution and troubleshooting
2. HTTP vs HTTPS
3. Network ports and listening services
4. SSH fundamentals
5. SSH key-based authentication
6. Bash network monitoring automation

## Practical Commands

- `getent hosts github.com` – DNS resolution
- `dig github.com` – DNS query
- `curl -I https://github.com` – HTTP response headers
- `ss -tuln` – Listening network sockets
- `ip route` – Routing information
- `ssh -T git@github.com` – Test GitHub SSH authentication

## SSH Configuration

Generated an ED25519 SSH key pair and configured GitHub authentication.

Changed the Git remote from HTTPS to SSH:

```bash
git remote set-url origin git@github.com:Nmn0807/devops-comeback-journey.git
```

Verified repository connectivity using `git ls-remote origin`.

**Security:** Private SSH keys and passphrases must never be committed or shared.

## Mini Project: Network Monitor

Created:

`bash/scripts/network-monitor.sh`

The script checks:

- Network interface status
- Default gateway availability
- DNS resolution
- HTTPS connectivity

## Exit Code Handling

- `0` – All checks passed.
- `1` – One or more checks failed.

Used an `overall_status` variable to collect failures while allowing all checks to execute.

## Successful Test Result

```text
Network interface: UP
Default gateway: AVAILABLE
DNS resolution: WORKING
HTTPS connectivity: WORKING
OVERALL STATUS: HEALTHY

Exit code: 0
```

## Key Learning

Network connectivity, DNS resolution, and application availability are separate dependencies. A monitoring script should check multiple conditions and report an overall health status.
