#!/usr/bin/env bash
# Git-HOL-04 : Resolving Merge Conflicts — solution script
set -e

echo "1. Verify master is clean"
git checkout master
git status

echo "2-4. Create GitWork branch, add & update hello.xml, commit"
git checkout -b GitWork
cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from GitWork branch</message>
</greeting>
EOF
git add hello.xml
git commit -m "Add hello.xml on GitWork branch"

cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from GitWork branch - updated</message>
</greeting>
EOF
git status
git add hello.xml
git commit -m "Update hello.xml content on GitWork branch"

echo "5-7. Switch to master, add hello.xml with different content, commit"
git checkout master
cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from master branch</message>
</greeting>
EOF
git add hello.xml
git commit -m "Add hello.xml on master branch"

echo "8-10. Inspect log and diffs"
git log --oneline --graph --decorate --all
git diff master GitWork -- hello.xml || true
# git difftool -t p4merge master GitWork -- hello.xml   # requires P4Merge

echo "11-12. Merge and observe conflict"
set +e
git merge GitWork
set -e
echo "----- hello.xml with conflict markers -----"
cat hello.xml

echo "13-14. Resolve conflict manually (or via: git mergetool -t p4merge) then commit"
cat > hello.xml <<'EOF'
<greeting>
  <message>Hello from master branch</message>
  <message>Hello from GitWork branch - updated</message>
</greeting>
EOF
git add hello.xml
git commit -m "Merge GitWork into master, resolve hello.xml conflict"

echo "15-16. Ignore backup files from merge tool"
echo "*.orig" >> .gitignore
git add .gitignore
git commit -m "Ignore merge tool backup files (*.orig)"

echo "17-19. List branches, delete merged branch, observe log"
git branch -a
git branch -d GitWork
git log --oneline --graph --decorate
