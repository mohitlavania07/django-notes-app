#!/bin/bash
echo "Copying new code over existing folder (overwriting if exists)..."
sudo rsync -av --delete --ignore-errors /home/ubuntu/tmp_deploy/ /home/ubuntu/django-notes-app/


