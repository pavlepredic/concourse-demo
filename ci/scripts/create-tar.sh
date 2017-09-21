#!/usr/bin/env bash

set -e

cd ../

mkdir releases
tar -czf releases/concourse-demo.tar.gz -C build-artifact