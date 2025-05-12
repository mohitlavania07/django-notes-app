#!/bin/bash
echo "Stopping Django service if running..."
sudo rm -rf /home/ubuntu/django-notes-app
systemctl stop django.service || true

