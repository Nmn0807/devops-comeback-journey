# Day 10 – Jenkins and CI/CD Fundamentals

## Objectives
- Understand Jenkins and its role in CI/CD.
- Understand Continuous Integration, Continuous Delivery and Continuous Deployment.
- Install Jenkins on Ubuntu WSL2.
- Create and execute a Freestyle project.
- Understand Jenkins workspaces, execution identity and exit codes.

## 1. Jenkins Overview

Jenkins is an open-source automation server used to automate software build, test and deployment processes.

Key concepts:
- **Controller:** Manages Jenkins configuration, jobs and execution.
- **Job:** A configured task Jenkins executes.
- **Build:** One execution of a job.
- **Workspace:** Directory used by a job to store files during execution.

## 2. CI/CD Fundamentals

- **Continuous Integration (CI):** Frequently integrate code changes and automatically build and test them.
- **Continuous Delivery:** Keep code ready for production deployment, often with manual approval.
- **Continuous Deployment:** Automatically deploy changes that pass the pipeline.

Typical pipeline:

GitHub → Jenkins → Build → Test → Docker Image → Deployment

## 3. Jenkins Installation

Installed OpenJDK 21 and Jenkins LTS on Ubuntu WSL2.

Verified Java:

```bash
java --version
javac --version
```

Managed Jenkins service:

```bash
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins --no-pager
```

Jenkins dashboard:

`http://localhost:8080`

## 4. First Freestyle Project

Created a Jenkins Freestyle project named `devops-first-job`.

Executed shell commands:

```bash
echo "My First Jenkins Build"
whoami
date
pwd
echo "Build completed successfully!"
```

Observed:
- Linux execution user: `jenkins`
- Workspace: `/var/lib/jenkins/workspace/devops-first-job`
- Build completed successfully.

## 5. Jenkins Execution and Exit Codes

| Exit code | Meaning |
|---|---|
| 0 | Success |
| Non-zero | Failure |

Tested intentional failure using:

```bash
exit 1
```

Jenkins marks the build as failed when a shell step returns a non-zero exit code.

## 6. CI/CD Failure Handling

If the Test stage fails, the Deploy stage should not execute.

Example:

1. Build – SUCCESS
2. Test – FAILURE
3. Deploy – SKIPPED

This prevents defective code from reaching production.

## 7. Important Commands

```bash
sudo systemctl status jenkins
sudo systemctl restart jenkins
sudo journalctl -u jenkins -n 50 --no-pager
sudo ss -ltnp | grep 8080
```

## Key Learnings

- Jenkins automates build, test and deployment workflows.
- A Freestyle project can execute shell commands.
- Jenkins jobs execute in their own workspaces.
- Jenkins uses exit codes to determine build success or failure.
- Failed tests should stop deployment.

## Completion Status

- [x] Java 21 installed
- [x] Jenkins installed and running
- [x] Jenkins dashboard accessed
- [x] First Freestyle project created
- [x] First successful build executed
- [x] Exit-code failure behaviour practised
- [x] CI/CD failure handling understood
- [ ] Jenkins Pipeline and Jenkinsfile

**Day 10: Jenkins Fundamentals – In Progress**

