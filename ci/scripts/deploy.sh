#!/usr/bin/env bash

mkdir ~/.ssh
echo "$AWS_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo StrictHostKeyChecking=no > ~/.ssh/config

DEPLOYMENT_NAME=concourse-demo

ssh $AWS_USERNAME@$AWS_IP "ls $DEPLOYMENT_NAME"
if [ $? == 0 ]; then
    echo "Stopping server..."
    ssh $AWS_USERNAME@$AWS_IP "~/$DEPLOYMENT_NAME/bin/stop-server"

    echo "Removing previous artifact..."
    ssh $AWS_USERNAME@$AWS_IP "rm -rf $DEPLOYMENT_NAME"
fi

echo "Copying new artifact..."
scp -r . $AWS_USERNAME@$AWS_IP:$DEPLOYMENT_NAME

echo "Starting server..."
ssh $AWS_USERNAME@$AWS_IP "~/$DEPLOYMENT_NAME/bin/start-server"

echo "Done"