#!/bin/bash

set -e  # fail fast on any error

echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Fixing ownership of app directory..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app

echo "[AfterInstall] Installing Python dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Running Django migrations..."
python /home/ubuntu/django-notes-app/manage.py migrate

echo "[AfterInstall] Collecting static files safely..."
python /home/ubuntu/django-notes-app/manage.py collectstatic --noinput

echo "[AfterInstall] Done."
