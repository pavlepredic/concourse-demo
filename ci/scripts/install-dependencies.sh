#!/usr/bin/env bash

# Ensure this script fails if anything errors
set -e

# Run Composer to install dependencies
composer install --no-interaction --no-progress --prefer-dist

# Output source with the dependencies
cp -R . ../source-code-with-dependencies
