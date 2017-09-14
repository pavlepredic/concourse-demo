#!/usr/bin/env bash

# Ensure this script fails if anything errors
set -e

# Get the changed files
CHANGED_FILES=$(git diff --name-only --diff-filter=ACMR origin/master | grep \\.php)

# Only lint when php files changed
if [ ! -z "$CHANGED_FILES" ]; then
    # Run PHP linter
    echo "Checking for syntax errors"
    echo "$CHANGED_FILES" | xargs -I {} -n1 -P8 php -l {}
fi
