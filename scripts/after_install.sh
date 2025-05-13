#!/bin/bash
echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Cleaning up old files..."
sudo rm -rf /home/ubuntu/django-notes-app/buildspec.yml
sudo rm -rf /home/ubuntu/django-notes-app/scripts
sudo rm -rf /home/ubuntu/django-notes-app/staticfiles

echo "[AfterInstall] Installing dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AfterInstall] Collecting static files..."
python /home/ubuntu/django-notes-app/manage.py collectstatic --noinput

echo "[AfterInstall] Copying files from temp directory to original destination..."
sudo cp -r /home/ubuntu/temp-django-notes-app/* /home/ubuntu/django-notes-app/

echo "[AfterInstall] Setting permissions for static files..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/django-notes-app/staticfiles

 sudo systemctl daemon-reload
 
echo "[AfterInstall] Restarting Django service..."
sudo systemctl restart django.service

sudo systemctl restart nginx
