#!/bin/sh -l

if [ -n $BASE_BRANCH ]; then
  echo "BASE_BRANCH environment variable not set, using \"master\""
  BASE_BRANCH=master
fi

if git diff --name-only origin/$BASE_BRANCH...$GITHUB_SHA | grep -F $1; then
    echo "At least 1 changed file matched the provided pattern"
    exit 0
else
    echo "No changed files match the provided pattern"
    exit 78
fi
