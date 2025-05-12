#!/bin/bash
set -e

echo "[INFO] Starting safe sync..."
DEPLOY_DIR="/home/ubuntu/django-notes-app"
SOURCE_DIR=$(pwd)

mkdir -p "$DEPLOY_DIR"

echo "[INFO] Syncing files without overwriting existing ones..."
sudo rsync -av --ignore-existing "$SOURCE_DIR"/ "$DEPLOY_DIR"/

echo "[INFO] Sync complete."





