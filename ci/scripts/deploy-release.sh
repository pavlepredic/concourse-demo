#!/usr/bin/env bash

set -e

cd release
tar -xzf concourse-demo.tar.gz

../source-code/ci/scripts/deploy.sh