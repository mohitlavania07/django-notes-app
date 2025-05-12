#!/bin/bash
echo "Stopping Django service if running..."
systemctl stop django.service || true

