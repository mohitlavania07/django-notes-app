#!/bin/bash

# Navigate to the project directory
cd /home/ubuntu/django-notes-app

# Check if virtualenv exists
if [ ! -d "/home/ubuntu/django-notes-app/venv" ]; then
  echo "Virtualenv not found. Creating a new one..."
  python3 -m venv /home/ubuntu/django-notes-app/venv
fi

# Activate virtual environment
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AFTER INSTALL] Installing dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt

echo "[AFTER INSTALL] Applying DB migrations..."
python manage.py migrate --noinput

echo "[AFTER INSTALL] Collecting static files..."
python manage.py collectstatic --noinput
