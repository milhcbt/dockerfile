#!/bin/bash

# Prepare Nginx configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/nginx/nginx.conf ]; then
  sudo mkdir -p /var/www/config/nginx
  sudo cp /etc/nginx/nginx.conf.docker /var/www/config/nginx/nginx.conf
fi
if [ ! -f /var/www/config/nginx/sites-available/default ]; then
  sudo mkdir -p /var/www/config/nginx/sites-available
  sudo cp /etc/nginx/sites-available/default.docker /var/www/config/nginx/sites-available/default
fi


# Prepare PHP-FPM configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/php5/fpm/php.ini ]; then
  sudo mkdir -p /var/www/config/php5/fpm
  sudo cp /etc/php5/fpm/php.ini.docker /var/www/config/php5/fpm/php.ini
fi
if [ ! -f /var/www/config/php5/fpm/pool.d/www.conf ]; then
  sudo mkdir -p /var/www/config/php5/fpm/pool.d
  sudo cp /etc/php5/fpm/pool.d/www.conf.docker /var/www/config/php5/fpm/pool.d/www.conf
fi


# Prepare PHP Composer configuration directory if the directory doesn't exist
# due to volume support
if [ ! -d /var/www/config/composer ]; then
  sudo mkdir -p /var/www/config/composer
fi


# Prepare Default Web Content file if the file doesn't exist
# due to volume support
if [[ ! -f /var/www/html/index.php && ! -f /var/www/html/public/index.php ]]; then
  sudo cp /var/www/docker/index.php /var/www/html/index.php
  sudo cp /var/www/docker/info.php /var/www/html/info.php
  sudo chmod -R 664 /var/www/html/
  sudo chown -R www-data:www-data /var/www/html/  
fi


# Try to start PHP-FPM on daemonize mode
sudo /usr/sbin/php5-fpm --daemonize


# Try to start Nginx on non-daemonize mode
sudo /usr/sbin/nginx


# End the script
exit 0
