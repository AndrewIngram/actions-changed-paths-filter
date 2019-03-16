#!/bin/bash

if [ -z ${BASE_BRANCH+x} ]; then
  echo "- BASE_BRANCH environment variable not set, using \"master\""
  BASE_BRANCH=master
fi

ALL_CHANGES=()

for expression in "$@"; do
    ALL_CHANGES+=($(git diff --name-only origin/$BASE_BRANCH...$GITHUB_SHA | grep ^$expression))
done

if (( ${#ALL_CHANGES[@]} )); then
    echo "- At least 1 changed file matched the provided pattern(s):"
    for i in "${ALL_CHANGES[@]}"; do
        echo "  - $i"
    done
    exit 0
else
    echo "- No changed files match the provided pattern"
    exit 78
fi
