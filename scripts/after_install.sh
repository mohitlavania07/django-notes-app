#!/bin/bash

echo "[AfterInstall] Activating virtualenv..."
source /home/ubuntu/django-notes-app/venv/bin/activate

echo "[AfterInstall] Installing dependencies..."
pip install -r /home/ubuntu/django-notes-app/requirements.txt
