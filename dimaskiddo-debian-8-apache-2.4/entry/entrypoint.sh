#!/bin/bash

# Prepare Apache configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/apache2/apache2.conf ]; then
  mkdir -p /var/www/config/apache2
  cp /etc/apache2/apache2.conf.docker /var/www/config/apache2/apache2.conf
fi
if [ ! -f /var/www/config/apache2/ports.conf ]; then
  mkdir -p /var/www/config/apache2
  cp /etc/apache2/ports.conf.docker /var/www/config/apache2/ports.conf
fi


# Prepare PHP Apache configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/php5/apache2/php.ini ]; then
  mkdir -p /var/www/config/php5/apache2
  cp /etc/php5/apache2/php.ini.docker /var/www/config/php5/apache2/php.ini
fi


# Setting-up Configuration directory permission if the file doesn't exist
# due to volume support
chmod -R 664 /var/www/config


# Prepare Default Web Content file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/html/index.php ]; then
  cp /var/www/docker/index.php /var/www/html/index.php
  cp /var/www/docker/info.php /var/www/html/info.php
fi


# Try to start Apache on non-daemonize mode
/usr/sbin/apache2ctl -D FOREGROUND


# End the script
exit 0
