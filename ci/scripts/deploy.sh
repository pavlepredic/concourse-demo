#!/usr/bin/env bash

set -e

mkdir ~/.ssh
echo "$AWS_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo StrictHostKeyChecking=no > ~/.ssh/config

echo "Stopping server..."
ssh $AWS_USERNAME@$AWS_IP "~/stop-server"

echo "Removing previous artifact..."
ssh $AWS_USERNAME@$AWS_IP "rm -rf concourse-demo"

echo "Copying new artifact..."
scp -r build-artifact $AWS_USERNAME@$AWS_IP:concourse-demo

echo "Starting server..."
ssh -$AWS_USERNAME@$AWS_IP "~/start-server"