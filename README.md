# Git-HOL-01 : Git Configuration, Notepad++ Integration & First Commit

## Objectives
- Set up your machine with Git configuration
- Integrate `notepad++.exe` with Git and make it the default editor
- Add a file to a source code repository

**Estimated time:** 30 minutes

---

## Step 1: Setup your machine with Git Configuration

**1.1 Verify Git is installed**
```bash
git --version
```
Expected output (version may differ):
```
git version 2.43.0.windows.1
```

**1.2 Set user-level configuration (name & email)**
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**1.3 Verify the configuration**
```bash
git config --list
# or check individual values
git config user.name
git config user.email
```

---

## Step 2: Integrate notepad++.exe with Git and make it the default editor

**2.1 Check if notepad++ runs from Git Bash**
```bash
notepad++
```
If Git Bash returns `command not found`, notepad++'s install folder is not on the `PATH`.

**2.2 Add notepad++ to the PATH (Windows)**
`Control Panel → System → Advanced system settings → Environment Variables → Path → Edit`
Add the Notepad++ install directory, typically:
```
C:\Program Files\Notepad++
```
Close and reopen Git Bash, then re-run:
```bash
notepad++
```
It should now launch Notepad++.

**2.3 Create an alias for notepad++**
```bash
alias notepad++="'/c/Program Files/Notepad++/notepad++.exe'"
```
Add this line to your Bash profile so it persists:
```bash
notepad++ ~/.bashrc
```
(save, then reload with `source ~/.bashrc`)

**2.4 Configure notepad++ as Git's default editor**
```bash
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
```

**2.5 Verify notepad++ is the default editor**
```bash
git config -e
```
`-e` opens the editor configured for Git — Notepad++ should launch. You can also confirm with:
```bash
git config --global -l
```

---

## Step 3: Add a file to the source code repository

**3.1 Create a new project folder and initialize it**
```bash
mkdir GitDemo
cd GitDemo
git init
```

**3.2 Verify the repository was initialized**
```bash
ls -la
```
You should see a hidden `.git` folder — this is the local Git repository/working directory metadata.

**3.3 Create `welcome.txt` with content**
```bash
echo "Welcome to Git Hands-On Lab" > welcome.txt
```

**3.4 Verify the file was created**
```bash
ls -la
```

**3.5 Verify the file content**
```bash
cat welcome.txt
```

**3.6 Check status**
```bash
git status
```
`welcome.txt` shows up as **untracked**.

**3.7 Stage the file (make it tracked)**
```bash
git add welcome.txt
```

**3.8 Commit with a multi-line commit message using the default editor**
```bash
git commit
```
Notepad++ opens — enter a commit message such as:
```
Add welcome.txt

Initial commit for GitDemo hands-on lab.
```
Save and close the editor to complete the commit.

**3.9 Confirm the working directory and local repository are in sync**
```bash
git status
```
Output: `nothing to commit, working tree clean` — confirming `welcome.txt` is committed to the local repository.

**3.10 Create a remote repository**
On GitHub/GitLab, create a new empty repository named **GitDemo**, then link it:
```bash
git remote add origin https://github.com/<your-username>/GitDemo.git
```

**3.11 Pull from the remote repository**
```bash
git pull origin master
```
> If the remote default branch is `main`, use `git pull origin main` instead, or rename your local branch: `git branch -M main`.

**3.12 Push the local repository to the remote**
```bash
git push origin master
```

---

## Summary of Commands
```bash
git --version
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --list
git config --global core.editor "'C:/Program Files/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"
git config -e

mkdir GitDemo && cd GitDemo
git init
echo "Welcome to Git Hands-On Lab" > welcome.txt
git status
git add welcome.txt
git commit
git status
git remote add origin <remote-url>
git pull origin master
git push origin master
```
