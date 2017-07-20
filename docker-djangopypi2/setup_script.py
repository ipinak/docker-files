import os

DOMAIN_NAME = "pypi.example.com"
ADMIN_USERNANE = "admin"
ADMIN_PASSWORD = "000000"
ADMIN_EMAIL = "admin@localhost"

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "djangopypi2.website.settings")
os.environ.setdefault("DJANGOPYPI2_ROOT", "/pypi-site/djangopypi2")

from django.contrib.sites.models import Site

default_site = Site.objects.get(id=1)
default_site.domain = DOMAIN_NAME
default_site.save()

from django.contrib.auth.models import User

default_user = User(username=ADMIN_USERNANE, email=ADMIN_EMAIL,
                    is_active=True, is_staff=True, is_superuser=True)
default_user.set_password(ADMIN_PASSWORD)
default_user.save()
