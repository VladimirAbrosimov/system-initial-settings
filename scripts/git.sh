#!/bin/bash
echo 'Enter commit name.'
read commitName

git status
echo ''
git add --all
echo ''
git commit -m $commitName
echo ''
git push origin master
