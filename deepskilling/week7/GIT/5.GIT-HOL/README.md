# Git-HOL-05 : Clean Up and Push Back to Remote Git

## Objectives
- Explain how to clean up and push back to remote Git
- Execute steps involving clean up and push back to remote Git

**Estimated time:** 10 minutes

**Prerequisite:** Hands-on ID `Git-T03-HOL_002` (Lab 4, Conflict Resolution)

---

## Solution — step by step

**1. Verify master is in a clean state**
```bash
git checkout master
git status
```
Expect: `On branch master`, `nothing to commit, working tree clean`.
This confirms all conflict-resolution work from Lab 4 is fully
committed locally before touching the remote.

**2. List all available branches**
```bash
git branch -a
```
Confirms `GitWork` was already deleted locally (Lab 4, step 18) and
shows any remaining local/remote branches, typically just `master`
(and `origin/master`).

**3. Pull the remote Git repository into master**
```bash
git pull origin master
```
This fetches and merges any changes that exist on the remote but not
locally, ensuring master is up to date before pushing (avoids a
rejected push due to a non-fast-forward history).

If the pull itself produces a conflict, resolve it the same way as in
Lab 4 (inspect conflict markers, use `git mergetool`, `git add`,
`git commit`) before proceeding.

**4. Push the pending changes to the remote repository**
```bash
git push origin master
```
This uploads the local commits from `Git-T03-HOL_002` (the merge
commit resolving the `hello.xml` conflict and the `.gitignore` update)
to the remote repository.

**5. Verify the changes are reflected in the remote repository**
```bash
git log --oneline --graph --decorate --all
```
Confirm `origin/master` and `master` now point to the same commit
(they'll show at the same position in the graph). Optionally verify
directly on GitHub/GitLab by browsing to the repository and confirming
`hello.xml` and `.gitignore` show the latest commits with matching
commit hashes/messages.

You can also cross-check the remote HEAD explicitly:
```bash
git fetch origin
git log origin/master --oneline -1
git log master --oneline -1
```
Matching commit hashes confirm the remote is fully in sync.

---

## Summary of Commands
```bash
git checkout master
git status
git branch -a
git pull origin master
git push origin master
git log --oneline --graph --decorate --all
git fetch origin
git log origin/master --oneline -1
git log master --oneline -1
```
