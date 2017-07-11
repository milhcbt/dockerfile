FROM dimaskiddo/debian:8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Layer 01
# Add Repository
RUN mkdir -p /root/repo/key/php-suhosin \
    && echo "" >> /etc/apt/sources.list \
    && echo "deb http://repo.suhosin.org/ debian-jessie main" >> /etc/apt/sources.list \
    && wget -O /root/repo/key/php-suhosin/repository.asc https://sektioneins.de/files/repository.asc \
    && apt-key add /root/repo/key/php-suhosin/repository.asc

# Layer 02
# Install Apache
RUN apt-get -y update \
    && apt-get -y install \
        apache2 \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && a2enmod dir \
    && a2enmod env \
    && a2enmod mime \
    && a2enmod alias \
    && a2enmod authn_core \
    && a2enmod authz_core \
    && a2enmod authz_host \
    && a2enmod authz_user \
    && a2enmod headers \
    && a2enmod reqtimeout \
    && a2enmod rewrite \
    && a2enmod proxy \
    && a2enmod proxy_http \
    && a2enmod deflate \
    && a2enmod ssl

# Layer 03
# Install PHP
RUN apt-get -y install \
      php5 \
      php-pear \
      php5-curl \
      php5-gd \
      php5-intl \
      php5-imagick \
      php5-imap \
      php5-mcrypt \
      php5-memcache \
      php5-pspell \
      php5-recode \
      php5-suhosin-extension \
      php5-mysqlnd \
      php5-sqlite \
      php5-tidy \
      php5-xmlrpc \
      php5-xsl \
      libapache2-mod-php5 \      
    && apt-get -y autoremove \
    && apt-get -y clean \
    && php5enmod suhosin

# Layer 04
# Install PHP Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && chmod 755 /usr/local/bin/composer \
    && mkdir -p /var/www/config/composer \
    && ln -sf /var/www/config/composer /home/user/.composer

# Layer 05
# Back-up Current Apache Configuration File
RUN cp /etc/apache2/ports.conf /etc/apache2/ports.conf.backup \
    && cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.backup \
    && unlink /etc/apache2/sites-enabled/000-default.conf \
    && mkdir -p /var/www/config/apache2 \
    && mkdir -p /var/www/docker

# Layer 06
# Copy Pre-Configured Apache Configuration File
COPY ./config/apache2/ports.conf /etc/apache2/ports.conf.docker
COPY ./config/apache2/apache2.conf /etc/apache2/apache2.conf.docker

# Layer 07
# Update Apache Configuration
RUN rm -f /etc/apache2/ports.conf \
    && rm -f /etc/apache2/apache2.conf \
    && chmod 644 /etc/apache2/ports.conf.docker \
    && chmod 644 /etc/apache2/apache2.conf.docker \
    && cp /etc/apache2/ports.conf.docker /etc/apache2/ports.conf \
    && cp /etc/apache2/apache2.conf.docker /var/www/config/apache2/apache2.conf \
    && ln -sf /var/www/config/apache2/apache2.conf /etc/apache2/apache2.conf \
    && chgrp -R root /var/run/apache2* /var/lock/apache2* \
    && chmod -R ug+rwx /var/run/apache2* /var/lock/apache2*

# Layer 08
# Back-up Current PHP Configuration
RUN cp /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.backup \
    && mkdir -p /var/www/config/php5/apache2

# Layer 09
# Copy Pre-Configured PHP Apache Configuration File
COPY ./config/php5/apache2/php.ini /etc/php5/apache2/php.ini.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php5/apache2/php.ini \
    && chmod 644 /etc/php5/apache2/php.ini.docker \
    && cp /etc/php5/apache2/php.ini.docker /var/www/config/php5/apache2/php.ini \
    && ln -sf /var/www/config/php5/apache2/php.ini /etc/php5/apache2/php.ini

# Layer 11
# Copy Default Web Content
COPY ./content/html/index.php /var/www/docker/index.php
COPY ./content/html/info.php /var/www/docker/info.php

# Layer 12
# Update Default Web Content
RUN rm -f /var/www/html/* \
    && chmod 644 /var/www/docker/index.php \
    && chmod 644 /var/www/docker/info.php \
    && cp /var/www/docker/index.php /var/www/html/index.php \
    && cp /var/www/docker/info.php /var/www/html/info.php \
    && chown www-data:www-data /var/www/html/index.php \
    && chown www-data:www-data /var/www/html/info.php

# Layer 13
# Copy Entrypoint Script
COPY ./entry/entrypoint.sh /usr/local/bin/entrypoint.sh

# Layer 14
# Change Entrypoint Permissions
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Revert Working User to "User"
USER user

# Expose Ports
EXPOSE 8080

# Execute Entrypoint Script
CMD ["/usr/local/bin/entrypoint.sh"]
