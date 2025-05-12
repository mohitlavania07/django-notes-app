#!/bin/bash
echo "Starting Django service..."
sudo systemctl daemon-reload
sudo systemctl restart django.service

