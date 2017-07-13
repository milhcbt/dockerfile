FROM dimaskiddo/debian:jessie
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Add Repository and Permissions
RUN mkdir -p /root/repo/key/php-suhosin \
    && echo "" >> /etc/apt/sources.list \
    && echo "deb http://repo.suhosin.org/ debian-jessie main" >> /etc/apt/sources.list \
    && wget -O /root/repo/key/php-suhosin/repository.asc https://sektioneins.de/files/repository.asc \
    && apt-key add /root/repo/key/php-suhosin/repository.asc \
    && mkdir -p /var/www/config \
    && chown root:root /var/www/config \
    && chmod a+rwx /var/www/config \
    && chmod a+rw /etc/passwd

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
    && chown -R root:root /var/www/config/composer \
    && chmod a+rwx /var/www/config/composer \
    && ln -sf /var/www/config/composer /.composer

# Layer 05
# Back-up Current Nginx Configuration File
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup \
    && cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup \
    && mkdir -p /var/www/config/nginx \
    && mkdir -p /var/www/config/nginx/sites-available \
    && mkdir -p /var/www/docker \
    && chown -R root:root /var/www/config/nginx \
    && chown -R root:root /var/www/config/nginx/sites-available \
    && chown -R root:root /var/www/docker \
    && chown -R root:root /var/www/html \
    && chmod a+rwx /var/www/config/nginx \
    && chmod a+rwx /var/www/config/nginx/sites-available \
    && chmod a+rwx /var/www/docker \
    && chmod a+rwx /var/www/html \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && chmod -R a+rwx /var/log/nginx    

# Layer 06
# Copy Pre-Configured Nginx Configuration File
COPY ./config/nginx/nginx.conf /etc/nginx/nginx.conf.docker
COPY ./config/nginx/sites-available/default /etc/nginx/sites-available/default.docker

# Layer 07
# Update Nginx Configuration
RUN rm -f /etc/nginx/nginx.conf \
    && rm -f /etc/nginx/sites-available/default \
    && chown root:root /etc/nginx/nginx.conf.docker \
    && chown root:root /etc/nginx/sites-available/default.docker \
    && chmod a+rw /etc/nginx/nginx.conf.docker \
    && chmod a+rw /etc/nginx/sites-available/default.docker \
    && cp /etc/nginx/nginx.conf.docker /etc/nginx/nginx.conf \
    && cp /etc/nginx/sites-available/default.docker /var/www/config/nginx/sites-available/default \
    && chown root:root /etc/nginx/nginx.conf \
    && chown root:root /var/www/config/nginx/sites-available/default \
    && chmod a+rw /etc/nginx/nginx.conf \
    && chmod a+rw /var/www/config/nginx/sites-available/default \
    && ln -sf /var/www/config/nginx/sites-available/default /etc/nginx/sites-available/default

# Layer 08
# Back-up Current PHP Configuration
RUN cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.backup \
    && cp /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/wwww.conf.backup \
    && mkdir -p /var/www/config/php5/fpm/pool.d \
    && chown -R root:root /var/www/config/php5 \
    && chown -R root:root /var/www/config/php5/fpm \    
    && chown -R root:root /var/www/config/php5/fpm/pool.d \
    && chmod a+rwx /var/www/config/php5 \
    && chmod a+rwx /var/www/config/php5/fpm \
    && chmod a+rwx /var/www/config/php5/fpm/pool.d

# Layer 09
# Copy Pre-Configured PHP FPM Configuration File
COPY ./config/php5/fpm/php.ini /etc/php5/fpm/php.ini.docker
COPY ./config/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php5/fpm/php.ini \
    && rm -f /etc/php5/fpm/pool.d/www.conf \
    && chown root:root /etc/php5/fpm/php.ini.docker \
    && chown root:root /etc/php5/fpm/pool.d/www.conf.docker \
    && chmod a+rw /etc/php5/fpm/php.ini.docker \
    && chmod a+rw /etc/php5/fpm/pool.d/www.conf.docker \
    && cp /etc/php5/fpm/php.ini.docker /var/www/config/php5/fpm/php.ini \
    && cp /etc/php5/fpm/pool.d/www.conf.docker /var/www/config/php5/fpm/pool.d/www.conf \
    && chown root:root /var/www/config/php5/fpm/php.ini \
    && chown root:root /var/www/config/php5/fpm/pool.d/www.conf \
    && chmod a+rw /var/www/config/php5/fpm/php.ini \
    && chmod a+rw /var/www/config/php5/fpm/pool.d/www.conf \
    && ln -sf /var/www/config/php5/fpm/php.ini /etc/php5/fpm/php.ini \
    && ln -sf /var/www/config/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf

# Layer 11
# Copy Default Web Content
COPY ./content/html/index.php /var/www/docker/index.php
COPY ./content/html/info.php /var/www/docker/info.php

# Layer 12
# Update Default Web Content
RUN rm -f /var/www/html/* \
    && chown root:root /var/www/docker/index.php \
    && chown root:root /var/www/docker/info.php \
    && chmod a+rw /var/www/docker/index.php \
    && chmod a+rw /var/www/docker/info.php \
    && cp /var/www/docker/index.php /var/www/html/index.php \
    && cp /var/www/docker/info.php /var/www/html/info.php \
    && chown root:root /var/www/html/index.php \
    && chown root:root /var/www/html/info.php \
    && chmod a+rw /var/www/html/index.php \
    && chmod a+rw /var/www/html/info.php

# Layer 13
# Copy Container Scripts
COPY ./entry/container-entrypoint /usr/local/bin/container-entrypoint
COPY ./entry/container-executor /usr/local/bin/container-executor

# Layer 14
# Change Container Scripts Permissions
RUN chmod 755 /usr/local/bin/container-entrypoint \
    && chmod 755 /usr/local/bin/container-executor

# Expose Ports
EXPOSE 8080

# Change Working Directory
WORKDIR /var/www/html

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/bin/container-entrypoint"]

# Set Executor Script
CMD ["/usr/local/bin/container-executor"]
