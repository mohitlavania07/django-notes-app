#!/bin/bash

echo "[AfterInstall] Copying updated code from temp to main project..."

# Copy everything **except** venv, staticfiles, and AWS config files
rsync -av --exclude 'venv' \
          --exclude 'staticfiles' \
          --exclude 'buildspec.yml' \
          --exclude 'scripts' \
          /home/ubuntu/temp-django-notes-app/ /home/ubuntu/django-notes-app/

echo "[AfterInstall] Setting correct permissions..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app

echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Installing Python dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Collecting static files..."
python /home/ubuntu/django-notes-app/manage.py collectstatic --noinput

echo "[AfterInstall] Restarting services..."
sudo systemctl daemon-reload
sudo systemctl restart django.service
sudo systemctl restart nginx

echo "[AfterInstall] Deployment completed successfully!"
