#!/bin/bash

echo "[AfterInstall] Cleaning up previous temp project if exists..."
sudo rm -rf /home/ubuntu/django-notes-app-old

echo "[AfterInstall] Backing up current project before overwrite..."
sudo mv /home/ubuntu/django-notes-app /home/ubuntu/django-notes-app-old

echo "[AfterInstall] Copying new files to main project folder..."
sudo cp -r /home/ubuntu/temp-django-notes-app /home/ubuntu/django-notes-app

echo "[AfterInstall] Setting permissions..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app

echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Installing dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Collecting static files..."
python /home/ubuntu/django-notes-app/manage.py collectstatic --noinput

echo "[AfterInstall] Restarting Django & Nginx..."
sudo systemctl daemon-reload
sudo systemctl restart django.service
sudo systemctl restart nginx

echo "[AfterInstall] Deployment completed successfully!"
