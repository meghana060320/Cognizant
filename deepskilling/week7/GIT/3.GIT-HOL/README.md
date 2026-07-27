# Git-HOL-03 : Branching & Merging

## Objectives
- Explain branching and merging
- Explain creating a branch request in GitLab
- Explain creating a merge request in GitLab
- Construct a branch, make changes, and merge it with master (trunk)

**Estimated time:** 30 minutes

**Prerequisite:** Git environment configured with the **P4Merge** tool
for Windows.

---

## Part A — Branching

**A.1 Create a new branch `GitNewBranch`**
```bash
git branch GitNewBranch
```

**A.2 List all local and remote branches**
```bash
git branch -a
```
The `*` next to a branch name marks the branch you are currently on
(e.g. `* master`).

**A.3 Switch to the new branch**
```bash
git checkout GitNewBranch
# (or, in one step instead of A.1+A.3: git checkout -b GitNewBranch)
```
Add a file with some content:
```bash
echo "Feature work on GitNewBranch" > feature.txt
```

**A.4 Commit the changes to the branch**
```bash
git add feature.txt
git commit -m "Add feature.txt on GitNewBranch"
```

**A.5 Check status**
```bash
git status
```
Output confirms: `On branch GitNewBranch`, `nothing to commit, working
tree clean`.

---

## Part B — Merging

**B.1 Switch back to master**
```bash
git checkout master
```

**B.2 List differences between trunk and branch (CLI)**
```bash
git diff master GitNewBranch
```

**B.3 List visual differences using P4Merge**
```bash
git difftool -t p4merge master GitNewBranch
```
(Requires `diff.tool=p4merge` configured — see `p4merge-setup.md`.)

**B.4 Merge the branch into master**
```bash
git merge GitNewBranch
```

**B.5 Observe the log after merging**
```bash
git log --oneline --graph --decorate
```
This shows the commit history as a graph, with branch/merge points and
labels (HEAD, master, GitNewBranch) decorated on each commit.

**B.6 Delete the branch after merging and check status**
```bash
git branch -d GitNewBranch
git status
git branch -a
```
`-d` only deletes the branch if it has been fully merged (safe delete).
The branch no longer appears in `git branch -a`.

---

## Summary of Commands
```bash
# Branching
git branch GitNewBranch
git branch -a
git checkout GitNewBranch
echo "Feature work on GitNewBranch" > feature.txt
git add feature.txt
git commit -m "Add feature.txt on GitNewBranch"
git status

# Merging
git checkout master
git diff master GitNewBranch
git difftool -t p4merge master GitNewBranch
git merge GitNewBranch
git log --oneline --graph --decorate
git branch -d GitNewBranch
git status
```

See `p4merge-setup.md` for configuring P4Merge as Git's diff/merge tool.
