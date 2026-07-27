# Git-HOL-04 : Resolving Merge Conflicts

## Objectives
- Explain how to resolve a conflict during merge
- Implement conflict resolution when multiple users update the trunk
  (master) in a way that conflicts with a branch's modifications

**Estimated time:** 30 minutes

**Prerequisite:** Hands-on ID `Git-T03-HOL_001` (Lab 3, Branching & Merging)

---

## Solution — step by step

**1. Verify master is in a clean state**
```bash
git checkout master
git status
```
Expect: `nothing to commit, working tree clean`.

**2. Create a branch `GitWork` and add `hello.xml`**
```bash
git checkout -b GitWork
cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from GitWork branch</message>
</greeting>
EOF
git add hello.xml
git commit -m "Add hello.xml on GitWork branch"
```

**3. Update the content of `hello.xml` and observe status**
```bash
cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from GitWork branch - updated</message>
</greeting>
EOF
git status
```
`hello.xml` shows as **modified**.

**4. Commit the changes to reflect in the branch**
```bash
git add hello.xml
git commit -m "Update hello.xml content on GitWork branch"
```

**5. Switch to master**
```bash
git checkout master
```

**6. Add `hello.xml` to master with different content**
```bash
cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from master branch</message>
</greeting>
EOF
git add hello.xml
```

**7. Commit the changes to master**
```bash
git commit -m "Add hello.xml on master branch"
```

**8. Observe the log**
```bash
git log --oneline --graph --decorate --all
```
The graph shows `master` and `GitWork` as diverged branches, each with
its own commit adding/editing `hello.xml`.

**9. Check differences with the Git diff tool**
```bash
git diff master GitWork -- hello.xml
```

**10. Visualize differences with P4Merge**
```bash
git difftool -t p4merge master GitWork -- hello.xml
```

**11. Merge the branch into master**
```bash
git merge GitWork
```
Because both branches modified the same lines of `hello.xml`, Git
reports a merge conflict:
```
Auto-merging hello.xml
CONFLICT (content): Merge conflict in hello.xml
Automatic merge failed; fix conflicts and then commit the result.
```

**12. Observe the Git conflict markup**
```bash
cat hello.xml
```
```xml
<greeting>
<<<<<<< HEAD
  <message>Hello from master branch</message>
=======
  <message>Hello from GitWork branch - updated</message>
>>>>>>> GitWork
</greeting>
```
`<<<<<<< HEAD` … `=======` … `>>>>>>> GitWork` delimit the two competing
versions.

**13. Use the 3-way merge tool to resolve the conflict**
```bash
git mergetool -t p4merge
```
P4Merge opens showing **Base**, **Local (master)**, **Remote (GitWork)**,
and **Merged Result** panes. Pick/combine the correct content, save, and
close — the resolved file replaces the conflict markers.

Manually, resolving to keep both messages could look like:
```xml
<greeting>
  <message>Hello from master branch</message>
  <message>Hello from GitWork branch - updated</message>
</greeting>
```

**14. Commit the changes once the conflict is resolved**
```bash
git add hello.xml
git commit -m "Merge GitWork into master, resolve hello.xml conflict"
```

**15. Observe git status and add the backup file to `.gitignore`**
```bash
git status
```
`git mergetool` typically leaves a backup file, e.g. `hello.xml.orig`,
shown as untracked. Add it to `.gitignore`:
```bash
echo "*.orig" >> .gitignore
```

**16. Commit the changes to `.gitignore`**
```bash
git add .gitignore
git commit -m "Ignore merge tool backup files (*.orig)"
```

**17. List all available branches**
```bash
git branch -a
```

**18. Delete the branch that was merged into master**
```bash
git branch -d GitWork
```

**19. Observe the log**
```bash
git log --oneline --graph --decorate
```
The graph now shows a single linear/merged history on `master`, with
the merge commit tying both lines of development together, and
`GitWork` no longer listed as a branch.

---

## Summary of Commands
```bash
git checkout master && git status
git checkout -b GitWork
# create hello.xml, commit
# edit hello.xml, commit
git checkout master
# create hello.xml (different content), commit
git log --oneline --graph --decorate --all
git diff master GitWork -- hello.xml
git difftool -t p4merge master GitWork -- hello.xml
git merge GitWork              # -> CONFLICT
cat hello.xml                  # inspect <<<<<<< ======= >>>>>>> markers
git mergetool -t p4merge       # resolve
git add hello.xml
git commit -m "Merge GitWork into master, resolve hello.xml conflict"
echo "*.orig" >> .gitignore
git add .gitignore
git commit -m "Ignore merge tool backup files (*.orig)"
git branch -a
git branch -d GitWork
git log --oneline --graph --decorate
```
