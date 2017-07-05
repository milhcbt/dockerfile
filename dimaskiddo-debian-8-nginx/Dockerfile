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
# Installing Nginx
RUN apt-get -y update \
    && apt-get -y install \
        nginx \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 03
# Installing PHP
RUN apt-get -y install \
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

# Layer 04
RUN apt-get -y install \
      php5-fpm \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 05
# Installing PHP Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

# Layer 06
# Configuring Logs Output
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Layer 07
# Backing-up Current Nginx Configuration File
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup \
    && cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup \
    && mv /var/www/html/index.html /var/www/html/index.html.backup \
    && mv /var/www/html/index.nginx-debian.html /var/www/html/index.nginx-debian.html.backup \
    && mkdir -p /var/www/config/nginx \
    && mkdir -p /var/www/config/nginx/sites-available \
    && mkdir -p /var/www/docker

# Layer 08
# Update Nginx Configuration File
COPY ./config/nginx/nginx.conf /etc/nginx/nginx.conf.docker
COPY ./config/nginx/sites-available/default /etc/nginx/sites-available/default.docker

# Layer 09
# Update Nginx Configuration
RUN chmod 644 /etc/nginx/nginx.conf.docker \
    && chmod 644 /etc/nginx/sites-available/default.docker \
    && cp /etc/nginx/nginx.conf.docker /var/www/config/nginx/nginx.conf \
    && cp /etc/nginx/sites-available/default.docker /var/www/config/nginx/sites-available/default \
    && rm -f /etc/nginx/nginx.conf \
    && rm -f /etc/nginx/sites-available/default \
    && ln -sf /var/www/config/nginx/nginx.conf /etc/nginx/nginx.conf \
    && ln -sf /var/www/config/nginx/sites-available/default /etc/nginx/sites-available/default

# Layer 10
# Backing-up Current PHP Configuration
RUN php5enmod suhosin \
    && cp /etc/php5/cli/php.ini /etc/php5/cli/php.ini.backup \
    && cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.backup \
    && mkdir -p /var/www/config/php5/fpm

# Layer 11
# Update PHP Configuration File
COPY ./config/php5/fpm/php.ini /etc/php5/fpm/php.ini.docker

# Layer 12
# Update PHP Configuration
RUN chmod 644 /etc/php5/fpm/php.ini.docker \
    && cp /etc/php5/fpm/php.ini.docker /var/www/config/php5/fpm/php.ini \
    && rm -f /etc/php5/fpm/php.ini \
    && ln -sf /var/www/config/php5/fpm/php.ini /etc/php5/fpm/php.ini

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

# Setting-up Working Directory
WORKDIR /var/www/html

# Expose Ports
EXPOSE 8080

# Entrypoint Preparation
ENTRPOINT ["/usr/local/bin/entrypoint.sh"]

# Execute Command
CMD ["/usr/sbin/nginx"]
