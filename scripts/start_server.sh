#!/bin/bash
echo "Starting Django service..."
systemctl daemon-reexec
systemctl daemon-reload
systemctl restart django.service

