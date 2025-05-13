#!/bin/bash
echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Installing dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Collecting static files..."
python /home/ubuntu/django-notes-app/manage.py collectstatic --noinput

echo "[AfterInstall] Setting permissions for static files..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app/staticfiles

sudo systemctl restart django.service
