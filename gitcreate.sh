#!/bin/bash

# https://gist.github.com/robwierzbowski/5430952/
# Create and push to a new github repo from the command line.  
# Grabs sensible defaults from the containing folder and `.gitconfig`.  
# Refinements welcome.

# Gather constant vars
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

# Get user input
read -p "New repo name:" reponame

read -p "GitHub username:" username
read -p "Repo Description:" description

echo "Thank you $username we now have all we need to create the repo $reponame : $description "

# Curl some json to the github API oh damn we so fancy
curl -u ${username} https://api.github.com/user/repos -d "{\"name\": \"${reponame:-${CURRENTDIR}}\", \"description\": \"${description}\", \"private\": true, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

# Set the freshly created repo to the origin and push
# You'll need to have added your public key to your github account
git remote set-url origin git@github.com:${USER:-${username}}/${reponame:-${CURRENTDIR}}.git
git push --set-upstream origin master
