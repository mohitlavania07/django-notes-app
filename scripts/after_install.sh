#!/bin/bash

echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Fixing permissions for staticfiles directory..."
chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app/staticfiles

echo "[AfterInstall] Installing Python dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Applying migrations..."
python manage.py migrate

echo "[AfterInstall] Collecting static files..."
python manage.py collectstatic --noinput

echo "[AfterInstall] Done."
