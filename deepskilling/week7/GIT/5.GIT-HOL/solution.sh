#!/usr/bin/env bash
# Git-HOL-05 : Clean Up and Push Back to Remote Git — solution script
set -e

echo "1. Verify master is clean"
git checkout master
git status

echo "2. List all branches"
git branch -a

echo "3. Pull remote into master"
git pull origin master

echo "4. Push pending local changes"
git push origin master

echo "5. Verify sync with remote"
git log --oneline --graph --decorate --all
git fetch origin
git log origin/master --oneline -1
git log master --oneline -1
