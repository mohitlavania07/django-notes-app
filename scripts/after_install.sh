#!/bin/bash

set -e

echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Fixing ownership of app directory..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app

echo "[AfterInstall] Fixing ownership of staticfiles directory..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app/staticfiles

echo "[AfterInstall] Installing dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Applying migrations..."
python /home/ubuntu/django-notes-app/manage.py migrate

echo "[AfterInstall] Collecting static files..."
python /home/ubuntu/django-notes-app/manage.py collectstatic --noinput

echo "[AfterInstall] Done."
