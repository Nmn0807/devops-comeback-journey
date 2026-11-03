# Day 8 - Advanced Git Workflows

## Topics Covered

1. Git rebase
2. Fast-forward merge
3. Git cherry-pick
4. Git revert
5. Git reset
6. Git stash

## 1. Git Rebase

Rebase replays commits from a feature branch onto a new base branch.

Command:
git rebase main

Key learning:
- Rebase creates new commit hashes.
- It produces a linear commit history.
- Avoid rebasing shared branches.

## 2. Fast-Forward Merge

Command:
git merge --ff-only feature/rebase-practice

Key learning:
- Moves the branch pointer forward.
- Does not create a merge commit when fast-forwarding.

## 3. Git Cherry-Pick

Command:
git cherry-pick <commit-hash>

Key learning:
- Applies a specific commit to the current branch.
- Creates a new commit with a different hash.

## 4. Git Revert

Command:
git revert <commit-hash>

Key learning:
- Creates a new commit that reverses an earlier commit.
- Suitable for undoing changes on shared branches.

## 5. Git Reset

Commands:

git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1

Key learning:
- Soft keeps changes staged.
- Mixed keeps changes unstaged.
- Hard discards changes from the working tree and index.

## 6. Git Stash

Commands:

git stash push -u -m "Work in progress"
git stash list
git stash apply
git stash pop

Key learning:
- Temporarily saves uncommitted changes.
- -u includes untracked files.
- Apply restores changes but keeps the stash.
- Pop restores changes and removes the stash after successful application.

## Practical Learning

Practised advanced Git workflows using local feature branches and verified each operation before publishing the lab..
