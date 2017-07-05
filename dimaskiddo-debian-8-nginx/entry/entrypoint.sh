#!/bin/bash

# Prepare Nginx configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/nginx/nginx.conf ]; then
  mkdir -p /var/www/config/nginx
  cp /etc/nginx/nginx.conf.docker /var/www/config/nginx/nginx.conf
fi
if [ ! -f /var/www/config/nginx/sites-available/default ]; then
  mkdir -p /var/www/config/nginx/sites-available
  cp /etc/nginx/sites-available/default.docker /var/www/config/nginx/sites-available/default
fi


# Prepare PHP-FPM configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/php5/fpm/php.ini ]; then
  mkdir -p /var/www/config/php5/fpm
  cp /etc/php5/fpm/php.ini.docker /var/www/config/php5/fpm/php.ini
fi
if [ ! -f /var/www/config/php5/fpm/pool.d/www.conf ]; then
  mkdir -p /var/www/config/php5/fpm/pool.d
  cp /etc/php5/fpm/pool.d/www.conf.docker /var/www/config/php5/fpm/pool.d/www.conf
fi


# Prepare Default Web Content file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/html/index.php ]; then
  cp /var/www/docker/index.php /var/www/html/index.php
  cp /var/www/docker/info.php /var/www/html/info.php
fi


# Try to start PHP-FPM on daemonize mode
/usr/sbin/php5-fpm --daemonize


# Try to start Nginx on non-daemonize mode
/usr/sbin/nginx


# End the script
exit 0
