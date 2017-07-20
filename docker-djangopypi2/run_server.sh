#!/bin/sh

if [ ! -f '/var/data/db.sqlite3' ]; then cp pypi-site/djangopypi2/db.sqlite3 /var/data/; fi
ln -sf /var/data/db.sqlite3 pypi-site/djangopypi2/db.sqlite3
if [ ! -d '/var/data/media' ]; then mkdir -p /var/data/media; fi
rm -r pypi-site/djangopypi2/media
ln -sf /var/data/media pypi-site/djangopypi2/media
chown www-data:www-data -R pypi-site/djangopypi2
chown www-data:www-data -R /var/data
supervisord -n
