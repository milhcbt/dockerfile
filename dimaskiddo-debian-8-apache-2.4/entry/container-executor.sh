#!/bin/bash

# Prepare Apache configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/apache2/apache2.conf ]; then
  mkdir -p /var/www/config/apache2
  cp /etc/apache2/apache2.conf.docker /var/www/config/apache2/apache2.conf
fi
chown user:root /var/www/config/apache2/apache2.conf
chmod 664 /var/www/config/apache2/apache2.conf


# Prepare PHP Apache configuration file if the file doesn't exist
# due to volume support
if [ ! -f /var/www/config/php5/apache2/php.ini ]; then
  mkdir -p /var/www/config/php5/apache2
  cp /etc/php5/apache2/php.ini.docker /var/www/config/php5/apache2/php.ini
fi
chown user:root /var/www/config/php5/apache2/php.ini
chmod 664 /var/www/config/php5/apache2/php.ini


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


# Try to start Apache on non-daemonize mode
/usr/sbin/apache2ctl -D FOREGROUND


# End the script
exit 0
