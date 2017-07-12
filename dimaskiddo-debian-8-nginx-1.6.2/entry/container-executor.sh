#!/bin/bash

# Prepare Nginx configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/nginx/sites-available/default ]; then
  mkdir -p /var/www/config/nginx/sites-available
  cp /etc/nginx/sites-available/default.docker /var/www/config/nginx/sites-available/default
fi
chown user:root /var/www/config/nginx/sites-available/default
chmod 664 /var/www/config/nginx/sites-available/default


# Prepare PHP-FPM configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/php5/fpm/php.ini ]; then
  mkdir -p /var/www/config/php5/fpm
  cp /etc/php5/fpm/php.ini.docker /var/www/config/php5/fpm/php.ini
fi
chown user:root /var/www/config/php5/fpm/php.ini
chmod 664 /var/www/config/php5/fpm/php.ini

if [ ! -f /var/www/config/php5/fpm/pool.d/www.conf ]; then
  mkdir -p /var/www/config/php5/fpm/pool.d
  cp /etc/php5/fpm/pool.d/www.conf.docker /var/www/config/php5/fpm/pool.d/www.conf
fi
chown user:root /var/www/config/php5/fpm/pool.d/www.conf
chmod 664 /var/www/config/php5/fpm/pool.d/www.conf


# Prepare PHP Composer configuration directory if the directory doesn't exist
# due to volume support
if [ ! -d /var/www/config/composer ]; then
  mkdir -p /var/www/config/composer
fi
chown user:user /var/www/config/composer


# Prepare Default Web Content file if the file doesn't exist
# due to volume support
if [[ ! -f /var/www/html/index.php && ! -f /var/www/html/public/index.php ]]; then
  cp /var/www/docker/index.php /var/www/html/index.php
  cp /var/www/docker/info.php /var/www/html/info.php
fi
chown -R user:root /var/www/html/
chmod -R 664 /var/www/html/*


# Try to start PHP-FPM on daemonize mode
sudo /usr/sbin/php5-fpm --daemonize


# Try to start Nginx on non-daemonize mode
sudo /usr/sbin/nginx


# End the script
exit 0
