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
# Install Nginx and SCM
RUN apt-get -y update \
    && apt-get -y install \
        nginx \
        git \
        subversion \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 03
# Install PHP
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
      php5-fpm \      
    && apt-get -y autoremove \
    && apt-get -y clean \
    && php5enmod suhosin \
    && echo "suhosin.executor.include.whitelist = phar" >> /etc/php5/cli/conf.d/suhosin.ini

# Layer 04
# Install PHP Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && chmod 755 /usr/local/bin/composer \
    && mkdir -p /var/www/config/composer \
    && ln -sf /var/www/config/composer /home/user/.composer \
    && chown -R user:user /var/www/config/composer \
    && chown -R user:user /home/user/.composer

# Layer 05
# Back-up Current Nginx Configuration File
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup \
    && cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup \
    && mkdir -p /var/www/config/nginx \
    && mkdir -p /var/www/config/nginx/sites-available \
    && mkdir -p /var/www/docker \
    && chown -R user:user /var/www/html \
    && chown -R user:user /var/www/docker

# Layer 06
# Copy Pre-Configured Nginx Configuration File
COPY ./config/nginx/nginx.conf /etc/nginx/nginx.conf.docker
COPY ./config/nginx/sites-available/default /etc/nginx/sites-available/default.docker

# Layer 07
# Update Nginx Configuration
RUN rm -f /etc/nginx/nginx.conf \
    && rm -f /etc/nginx/sites-available/default \
    && chmod 644 /etc/nginx/nginx.conf.docker \
    && chmod 644 /etc/nginx/sites-available/default.docker \
    && cp /etc/nginx/nginx.conf.docker /etc/nginx/nginx.conf \
    && cp /etc/nginx/sites-available/default.docker /var/www/config/nginx/sites-available/default \
    && ln -sf /var/www/config/nginx/sites-available/default /etc/nginx/sites-available/default

# Layer 08
# Back-up Current PHP Configuration
RUN cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.backup \
    && cp /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/wwww.conf.backup \
    && mkdir -p /var/www/config/php5/fpm \
    && mkdir -p /var/www/config/php5/fpm/pool.d

# Layer 09
# Copy Pre-Configured PHP FPM Configuration File
COPY ./config/php5/fpm/php.ini /etc/php5/fpm/php.ini.docker
COPY ./config/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php5/fpm/php.ini \
    && rm -f /etc/php5/fpm/pool.d/www.conf \
    && chmod 644 /etc/php5/fpm/php.ini.docker \
    && chmod 644 /etc/php5/fpm/pool.d/www.conf.docker \
    && cp /etc/php5/fpm/php.ini.docker /var/www/config/php5/fpm/php.ini \
    && cp /etc/php5/fpm/pool.d/www.conf.docker /var/www/config/php5/fpm/pool.d/www.conf \
    && ln -sf /var/www/config/php5/fpm/php.ini /etc/php5/fpm/php.ini \
    && ln -sf /var/www/config/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf

# Layer 11
# Copy Default Web Content
COPY ./content/html/index.php /var/www/docker/index.php
COPY ./content/html/info.php /var/www/docker/info.php

# Layer 12
# Update Default Web Content
RUN rm -f /var/www/html/* \
    && chown user:user /var/www/docker/index.php \
    && chown user:user /var/www/docker/info.php \
    && chmod 644 /var/www/docker/index.php \
    && chmod 644 /var/www/docker/info.php \
    && cp /var/www/docker/index.php /var/www/html/index.php \
    && cp /var/www/docker/info.php /var/www/html/info.php \
    && chown user:user /var/www/html/index.php \
    && chown user:user /var/www/html/info.php \
    && ln -sf /var/www/html /home/user/public_html \
    && chown -R user:user /home/user/public_html \
    && chmod -R 644 /home/user/public_html/*

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
