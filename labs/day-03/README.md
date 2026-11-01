# Day 3 - Advanced Linux and Bash Scripting

## Topics Covered

1. Bash variables
2. Command substitution
3. Conditional statements (if, else, elif)
4. Comparison operators
5. Disk usage monitoring
6. Linux exit codes
7. Bash loops
8. Bash functions
9. Function arguments ($1)
10. Local variables

## Practical Scripts

### 1. Disk Health Check
File: bash/scripts/disk-health-check.sh

Checks root filesystem disk usage and reports:
- Normal
- Getting high
- High disk usage warning

### 2. Server Health Check
File: bash/scripts/server-health-check.sh

Checks multiple domains using:
- Bash functions
- For loops
- Ping
- Conditional statements
- Exit codes

## Important Commands

- df -h: Display disk usage
- echo $?: Display last command exit code
- chmod +x: Make a script executable
- ping: Test network reachability

## Key Learnings

- Exit code 0 indicates success.
- Non-zero exit codes generally indicate failure.
- Functions make scripts reusable.
- Loops automate repetitive tasks.
- Variables store reusable values.
- Conditions allow scripts to make decisions.

## Real-World DevOps Application

These concepts are useful for server monitoring,
troubleshooting, automation and CI/CD pipelines.
