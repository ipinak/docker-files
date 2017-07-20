import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "djangopypi2.website.settings")
os.environ.setdefault("DJANGOPYPI2_ROOT", "/pypi-site/djangopypi2")

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
