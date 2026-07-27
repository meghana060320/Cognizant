# Configuring P4Merge as Git's Diff/Merge Tool (Windows)

1. Download and install **P4Merge** (Helix Visual Merge Tool) from Perforce.
2. Configure Git to use it as the diff tool:
```bash
git config --global diff.tool p4merge
git config --global difftool.p4merge.cmd \
  "'C:/Program Files/Perforce/p4merge.exe' \"$LOCAL\" \"$REMOTE\""
git config --global difftool.prompt false
```
3. Configure Git to use it as the merge tool:
```bash
git config --global merge.tool p4merge
git config --global mergetool.p4merge.cmd \
  "'C:/Program Files/Perforce/p4merge.exe' \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\""
git config --global mergetool.prompt false
```
4. Verify:
```bash
git config --global -l | grep -i p4merge
```
5. Use it:
```bash
git difftool -t p4merge <branch1> <branch2>
git mergetool -t p4merge
```
