"""
WSGI config for notesapp project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/howto/deployment/wsgi/
"""

import os

# 🔧 X-Ray SDK imports
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all

# 📍 Set up X-Ray recorder
xray_recorder.configure(service='notesapp')  # Name shown in X-Ray
patch_all()  # Auto-instrument supported libraries

from django.core.wsgi import get_wsgi_application

# 🛠 Set default settings module
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'notesapp.settings')

# 🚀 Start WSGI app with tracing enabled
application = get_wsgi_application()

