#!/bin/bash
set -e

cd /home/ubuntu/django-notes-app

echo "[AfterInstall] Activating virtualenv..."
source venv/bin/activate

echo "[AfterInstall] Installing dependencies..."
pip install -r requirements.txt

echo "[AfterInstall] Migrating database..."
python manage.py migrate

echo "[AfterInstall] Collecting static files..."
python manage.py collectstatic --noinput

echo "[AfterInstall] Done."
