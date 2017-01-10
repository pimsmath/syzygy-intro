#!/bin/bash
set -x
REPO_PATH="https://github.com/pimsmath/syzygy-intro.git"


echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
if [ $# -eq 1 ]
  then msg="$1"
else
  echo "Usage: $0 \"Commit Message\""
  exit 1
fi

# Build the project.
if ! hugo ; then
  echo "Hugo non-zero exit code"
  exit 1
fi

# Add changes to git.
echo "Adding changes to git `git add -A`"
if ! git add -A ; then
  echo "Git failed to add changes!"
  exit
fi

# Commit changes.
echo "Commiting changes locally"
if ! git commit -m "$msg" ; then
  echo "Git commit failed!"
fi

# Push source and build repos.
echo "Pushing master and gh-pages branches to github"
if ! git push origin master; then
  echo "Failed to push master to origin!"
  exit
fi
if ! git subtree push --prefix=public ${REPO_PATH} gh-pages ; then
  echo "Failed to push changes in gh-pages branch"
fi
