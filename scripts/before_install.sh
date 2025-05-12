#!/bin/bash
set -e

echo "Syncing files to destination..."
DEPLOY_DIR=/home/ubuntu/django-notes-app
SOURCE_DIR=$CODEDEPLOY_DEPLOYMENT_ROOT/$CODEDEPLOY_DEPLOYMENT_GROUP_ID/deployment-archive

# Create destination directory if not exist
mkdir -p $DEPLOY_DIR

# rsync to copy only new files, skip existing ones
sudo rsync -av --ignore-existing $SOURCE_DIR/ $DEPLOY_DIR/



