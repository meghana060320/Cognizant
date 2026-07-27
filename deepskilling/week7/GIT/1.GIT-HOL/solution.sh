#!/usr/bin/env bash
# Git-HOL-01 : Git Configuration & First Commit — solution script
set -e

echo "Step 1: Verify Git installation"
git --version

echo "Step 1: Configure user name and email"
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --list

echo "Step 3: Initialize repository"
mkdir -p GitDemo
cd GitDemo
git init

echo "Step 3: Create and inspect welcome.txt"
echo "Welcome to Git Hands-On Lab" > welcome.txt
ls -la
cat welcome.txt
git status

echo "Step 3: Stage and commit"
git add welcome.txt
git commit -m "Add welcome.txt" -m "Initial commit for GitDemo hands-on lab."
git status

echo "Step 3: Connect and sync with remote (edit REMOTE_URL first)"
REMOTE_URL="https://github.com/<your-username>/GitDemo.git"
git remote add origin "$REMOTE_URL" || true
git branch -M master
# git pull origin master --allow-unrelated-histories
# git push -u origin master

echo "Done. Uncomment the pull/push lines once your remote is ready."
