#!/usr/bin/env bash

# Ensure this script fails if anything errors
set -e

# Get the changed files
CHANGED_FILES=$(git diff --name-only --diff-filter=ACMR origin/master | grep \\.php)
if [ -z "$CHANGED_FILES" ]; then
    exit 0
fi

# Run PHP linter
echo "Checking for syntax errors"
echo "$CHANGED_FILES" | xargs -I {} -n1 -P8 php -l {}
