# Git-HOL-02 : Ignoring Unwanted Files with `.gitignore`

## Objectives
- Explain `.gitignore`
- Explain how to ignore unwanted files using `.gitignore`
- Implement `.gitignore` to ignore unwanted files and folders

**Estimated time:** 20 minutes

## Task
Create a `.log` file and a `log` folder in the working directory of Git.
Update the `.gitignore` file so that on committing, these files (`.log`
extension files and `log` folders) are ignored. Verify that `git status`
reflects this correctly across the working directory, local repository,
and remote repository.

---

## Solution

**2.1 Confirm you are inside an initialized Git repository**
```bash
cd GitDemo
git status
```

**2.2 Create a `.log` file**
```bash
echo "sample log entry" > application.log
```

**2.3 Create a `log` folder with a file inside it**
```bash
mkdir log
echo "debug output" > log/debug.log
```

**2.4 Check status before ignoring anything**
```bash
git status
```
Both `application.log` and the `log/` folder show up as **untracked**.

**2.5 Create/update the `.gitignore` file**
```bash
touch .gitignore
```
Add the following rules to `.gitignore` (see the `.gitignore` file in this
folder for the finished version):
```
# Ignore all files with a .log extension
*.log

# Ignore the entire log folder
log/
```

**2.6 Verify git status again**
```bash
git status
```
`application.log` and the `log/` folder no longer appear as untracked —
Git now ignores them.

**2.7 Stage and commit the `.gitignore` file itself**
```bash
git add .gitignore
git commit -m "Add .gitignore to ignore .log files and log folder"
```

**2.8 Confirm ignored files stay untracked even with `git add -A`**
```bash
git add -A
git status
```
Only the `.gitignore` change is staged/committed — the log file and folder
remain untracked/ignored.

**2.9 (Optional) List files Git is ignoring**
```bash
git status --ignored
```

**2.10 Sync with the remote repository**
```bash
git push origin master
```
Confirm on GitLab/GitHub that the remote repository shows the updated
`.gitignore` file, while `application.log` and the `log/` folder are
absent from the remote — proving they were never tracked or pushed.

---

## Summary of Commands
```bash
echo "sample log entry" > application.log
mkdir log && echo "debug output" > log/debug.log
git status

cat >> .gitignore <<'EOF'
*.log
log/
EOF

git status
git add .gitignore
git commit -m "Add .gitignore to ignore .log files and log folder"
git status --ignored
git push origin master
```
