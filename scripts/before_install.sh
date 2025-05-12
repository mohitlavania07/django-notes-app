#!/bin/bash
set -e

echo "[BeforeInstall] Copying new files only (skip existing) to /home/ubuntu/django-notes-app..."

sudo rsync -av --ignore-existing /home/ubuntu/code-temp/ /home/ubuntu/django-notes-app/

echo "[BeforeInstall] Clean temp code directory..."
sudo rm -rf /home/ubuntu/code-temp

echo "[BeforeInstall] Done."
