#!/usr/bin/env bash
# Git-HOL-02 : .gitignore — solution script
set -e

echo "Create a .log file and a log folder"
echo "sample log entry" > application.log
mkdir -p log
echo "debug output" > log/debug.log

echo "Status BEFORE .gitignore"
git status

echo "Write .gitignore rules"
cat >> .gitignore <<'EOF'
*.log
log/
EOF

echo "Status AFTER .gitignore"
git status

echo "Commit .gitignore"
git add .gitignore
git commit -m "Add .gitignore to ignore .log files and log folder"

echo "Show ignored files explicitly"
git status --ignored

echo "Push to remote (uncomment when remote is configured)"
# git push origin master
