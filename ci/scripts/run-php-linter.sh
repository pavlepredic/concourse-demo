#!/usr/bin/env bash

# Get the changed files
CHANGED_FILES=$(git diff --name-only --diff-filter=ACMR origin/master | grep \\.php)
if [ -z "$CHANGED_FILES" ]; then
    echo "No php files changed; skipping linter."
    exit 0
fi

set -e

# Run PHP linter
echo "Checking for syntax errors"
echo "$CHANGED_FILES" | xargs -I {} -n1 -P8 php -l {}
