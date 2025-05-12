#!/bin/bash
echo "Copying new code over existing folder (overwriting if exists)..."
rsync -av --delete /home/ubuntu/tmp_deploy/ /home/ubuntu/django-notes-app/


