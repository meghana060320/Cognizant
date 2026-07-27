#!/usr/bin/env bash
# Git-HOL-03 : Branching & Merging — solution script
set -e

echo "--- Branching ---"
git branch GitNewBranch
git branch -a

git checkout GitNewBranch
echo "Feature work on GitNewBranch" > feature.txt
git add feature.txt
git commit -m "Add feature.txt on GitNewBranch"
git status

echo "--- Merging ---"
git checkout master
git diff master GitNewBranch || true
# git difftool -t p4merge master GitNewBranch   # requires P4Merge installed

git merge GitNewBranch
git log --oneline --graph --decorate

git branch -d GitNewBranch
git status
git branch -a
