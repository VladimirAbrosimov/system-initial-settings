#!/bin/bash
echo 'Enter project name.'
read projectName
projectPath="$WebPath/$projectName"
mkdir $projectPath
cp -r $GitHubPath/template/* $projectPath
echo "File $projectName is created."
