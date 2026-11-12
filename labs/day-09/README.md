
# Day 9 - Git Branching Strategies and Team Workflows

## 1. Objectives

- Understand Git Flow and GitHub Flow.
- Practise feature branches.
- Understand Pull Requests (PRs).
- Learn code review practices.
- Understand merge strategies.
- Configure GitHub branch protection using Rulesets.

## 2. Git Flow vs GitHub Flow

### Git Flow

Git Flow uses multiple long-lived branches:

- main: Production-ready code.
- develop: Integration branch.
- feature/*: New features.
- release/*: Release preparation.
- hotfix/*: Production bug fixes.

### GitHub Flow

GitHub Flow is a simpler workflow:

1. Create a feature branch from main.
2. Make changes and commit them.
3. Push the feature branch to GitHub.
4. Open a Pull Request.
5. Review and test the changes.
6. Merge the PR into main.

## 3. Feature Branches

Feature branches allow developers to work independently without directly modifying main.

Example:

```bash
git switch main
git pull --ff-only origin main
git switch -c feature/deployment-documentation
```

## 4. Pull Requests and Code Reviews

A Pull Request allows developers to propose changes and request review before merging them into the main branch.

Review checklist:

- Verify deployment steps.
- Check prerequisites.
- Verify rollback instructions.
- Check post-deployment health checks.
- Ensure no passwords, private keys or tokens are committed.

## 5. Merge Strategies

### Squash and Merge
Combines multiple feature branch commits into one commit on the target branch.

### Merge Commit
Preserves the branch history and creates a merge commit.

### Rebase and Merge
Replays commits on top of the target branch to create a linear history.

## 6. Practical Project: Deployment Documentation

Created:

`projects/deployment-workflow/DEPLOYMENT.md`

The document includes:

- Deployment prerequisites.
- Application deployment steps.
- Rollback procedure.
- Post-deployment verification.

The file was submitted through a Pull Request and successfully merged into main.

## 7. GitHub Branch Protection

Created a GitHub Ruleset named `protect-main`.

Configured protections:

- Require a pull request before merging.
- Block force pushes.
- Restrict deletions.

Required approvals and status checks were left disabled during this lab.

## 8. Important Git Commands

```bash
git switch -c feature/branch-name
git add .
git commit -m "Add documentation"
git push -u origin feature/branch-name
git switch main
git pull --ff-only origin main
git branch -d feature/branch-name
git log --oneline -5
git status
```

## 9. Key Learnings

- Why teams use feature branches.
- How Pull Requests support collaboration.
- Why code reviews are important.
- How merge strategies affect Git history.
- Why production branches need protection.
- Why secrets must never be committed to GitHub.

## 10. Day 9 Status

Completed Git branching, Pull Request workflow,
code review practice and GitHub branch protection.

