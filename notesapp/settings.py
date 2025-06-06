import os
from pathlib import Path

# ✅ AWS X-Ray imports
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.ext.django.middleware import XRayMiddleware

# 🛠 X-Ray Configuration
xray_recorder.configure(service='notesapp')  # Name that will appear in X-Ray console

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = 'django-insecure-&dzi#zsb(hz6p(s#anunt&#-a%ohr2hld71*i72*^exvw-yq$y'

SESSION_ENGINE = "django.contrib.sessions.backends.cache"
SESSION_CACHE_ALIAS = "default"


DEBUG = True

ALLOWED_HOSTS = ['*']

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'api.apps.ApiConfig',
    'rest_framework',
    'corsheaders'
]

MIDDLEWARE = [
    'aws_xray_sdk.ext.django.middleware.XRayMiddleware',  # ✅ X-Ray middleware (must be first)
    'django.middleware.security.SecurityMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    "whitenoise.middleware.WhiteNoiseMiddleware",
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    # 'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'notesapp.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            BASE_DIR / 'mynotes/build'
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
    )
}

WSGI_APPLICATION = 'notesapp.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'notesdb',
        'USER': 'admin',
        'PASSWORD': 'admin9818165149',
        'HOST': 'node-application-database.cwrey2sk8xkr.us-east-1.rds.amazonaws.com',
        'PORT': '3306',
    }
}

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True

STATIC_URL = 'static/'

STATICFILES_DIRS = [os.path.join(BASE_DIR, 'mynotes/build/static')]

STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

CORS_ORIGIN_ALLOW_ALL = True

# ✅ X-Ray advanced settings (optional but useful)
XRAY_RECORDER = {
    'AUTO_INSTRUMENT': True,
    'SAMPLING': True,
    'CONTEXT_MISSING': 'LOG_ERROR',
    # 'PLUGINS': ('ElasticBeanstalkPlugin',),  # Uncomment if deployed on Elastic Beanstalk
}

CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': 'redis://master.rediscluster.3brnnv.use1.cache.amazonaws.com:6379/1',  # Use your Redis hostname and DB index
        'OPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
            'PASSWORD': None,  # Add password if required
            'SSL': True,  # Use SSL for secure communication
        }
    }
}

