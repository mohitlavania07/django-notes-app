#!/bin/bash

APP_DIR="/home/ubuntu/django-notes-app"
VENV_DIR="$APP_DIR/venv"

echo "[AfterInstall] Checking virtual environment..."
if [ ! -d "$VENV_DIR" ]; then
  echo "[AfterInstall] venv not found. Creating new virtual environment..."
  python3 -m venv $VENV_DIR
fi

echo "[AfterInstall] Activating virtual environment..."
source $VENV_DIR/bin/activate

echo "[AfterInstall] Cleaning up unnecessary files..."
rm -f $APP_DIR/buildspec.yml
rm -rf $APP_DIR/scripts
rm -rf $APP_DIR/staticfiles

echo "[AfterInstall] Installing dependencies..."
pip install --upgrade pip
pip install -r $APP_DIR/requirements.txt

echo "[AfterInstall] Collecting static files..."
python $APP_DIR/manage.py collectstatic --noinput

echo "[AfterInstall] Setting permissions for static files..."
sudo chown -R ubuntu:ubuntu $APP_DIR/staticfiles

echo "[AfterInstall] Restarting Django service..."
sudo systemctl restart django.service
