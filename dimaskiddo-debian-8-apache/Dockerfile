FROM dimaskiddo/debian:jessie
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Adding Repository
RUN mkdir -p /root/repo/key/php-suhosin \
    && echo "" >> /etc/apt/sources.list \
    && echo "deb http://repo.suhosin.org/ debian-jessie main" >> /etc/apt/sources.list \
    && wget -O /root/repo/key/php-suhosin/repository.asc https://sektioneins.de/files/repository.asc \
    && apt-key add /root/repo/key/php-suhosin/repository.asc

# Layer 02
# Installing Apache
RUN apt-get -y update \
    && apt-get -y install \
        apache2 \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 03
# Configuring Apache Module
RUN a2enmod dir \
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

# Layer 04
# Installing PHP
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
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 05
# Installing PHP Apache Module
RUN apt-get -y install \
      libapache2-mod-php5 \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 06
# Installing PHP Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Layer 07
# Configuring Logs Output
RUN ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log

# Layer 08
# Backing-up Current Apache Configuration File
RUN cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.backup \
    && cp /etc/apache2/ports.conf /etc/apache2/ports.conf.backup \
    && cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.backup \
    && cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.backup \
    && mv /var/www/html/index.html /var/www/html/index.html.backup \
    && unlink /etc/apache2/sites-enabled/000-default.conf \
    && mkdir -p /var/www/config/apache2 \
    && mkdir -p /var/www/docker

# Layer 09
# Update Apache Configuration File
COPY ./config/apache2/apache2.conf /etc/apache2/apache2.conf.docker
COPY ./config/apache2/ports.conf /etc/apache2/ports.conf.docker

# Layer 10
# Update Apache Configuration
RUN chmod 644 /etc/apache2/apache2.conf.docker \
    && chmod 644 /etc/apache2/ports.conf.docker \
    && cp /etc/apache2/apache2.conf.docker /var/www/config/apache2/apache2.conf \
    && cp /etc/apache2/ports.conf.docker /var/www/config/apache2/ports.conf \
    && rm -f /etc/apache2/apache2.conf \
    && rm -f /etc/apache2/ports.conf \    
    && ln -sf /var/www/config/apache2/apache2.conf /etc/apache2/apache2.conf \
    && ln -sf /var/www/config/apache2/ports.conf /etc/apache2/ports.conf \
    && chgrp -R root /var/run/apache2* /var/lock/apache2* \
    && chmod -R ug+rwx /var/run/apache2* /var/lock/apache2*

# Layer 11
# Backing-up Current PHP Configuration
RUN php5enmod suhosin \
    && cp /etc/php5/cli/php.ini /etc/php5/cli/php.ini.backup \
    && cp /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.backup \
    && mkdir -p /var/www/config/php5/apache2

# Layer 12
# Update PHP Configuration File
COPY ./config/php5/apache2/php.ini /etc/php5/apache2/php.ini.docker

# Layer 13
# Update PHP Configuration
RUN chmod 644 /etc/php5/apache2/php.ini.docker \
    && cp /etc/php5/apache2/php.ini.docker /var/www/config/php5/apache2/php.ini \
    && rm -f /etc/php5/apache2/php.ini \
    && ln -sf /var/www/config/php5/apache2/php.ini /etc/php5/apache2/php.ini

# Layer 14
# Copy Default Web Content
COPY ./content/html/index.php /var/www/docker/index.php
COPY ./content/html/info.php /var/www/docker/info.php

# Layer 15
# Configuring Default Web Content
RUN chmod 644 /var/www/docker/index.php \
    && chmod 644 /var/www/docker/info.php \
    && chown www-data:www-data /var/www/docker/index.php \
    && chown www-data:www-data /var/www/docker/info.php \
    && cp /var/www/docker/index.php /var/www/html/index.php \
    && cp /var/www/docker/info.php /var/www/html/info.php

# Layer 16
# Copy Entrypoint Script
COPY ./entry/entrypoint.sh /usr/local/bin/entrypoint.sh

# Layer 17
# Change Entrypoint Permissions
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Setting-up Working Directory
WORKDIR /var/www/html

# Expose Ports
EXPOSE 8080

# Entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
