#!/usr/bin/env bash

set -e

echo "Stopping server..."
ssh -i <(echo $AWS_PRIVATE_KEY) $AWS_USERNAME@$AWS_IP "~/stop-server"

echo "Removing previous artifact..."
ssh -i <(echo $AWS_PRIVATE_KEY) $AWS_USERNAME@$AWS_IP "rm -rf concourse-demo"

echo "Copying new artifact..."
scp -ri <(echo $AWS_PRIVATE_KEY) build-artifact $AWS_USERNAME@$AWS_IP:concourse-demo

echo "Starting server..."
ssh -i <(echo $AWS_PRIVATE_KEY) $AWS_USERNAME@$AWS_IP "~/start-server"