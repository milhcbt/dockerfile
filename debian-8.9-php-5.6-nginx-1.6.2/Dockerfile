FROM dimaskiddo/debian:8.9
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Add Repository and Run Some Housekeeping
RUN mkdir -p /repo/key/php-suhosin \
    && echo "" >> /etc/apt/sources.list \
    && echo "deb http://repo.suhosin.org/ debian-jessie main" >> /etc/apt/sources.list \
    && wget -O /repo/key/php-suhosin/repository.asc https://sektioneins.de/files/repository.asc \
    && apt-key add /repo/key/php-suhosin/repository.asc \
    && mkdir -p /var/www/etc \
    && chown root:root /var/www \
    && chown root:root /var/www/etc \
    && chmod 775 /var/www \
    && chmod 775 /var/www/etc

# Layer 02
# Install Nginx and SCM
RUN apt-get -y update \
    && apt-get -y install \
        nginx \
        subversion \
        git \
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
      php5-mongo \
      php5-mysqlnd \
      php5-pgsql \
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
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod 755 /usr/local/bin/composer \
    && mkdir -p /var/www/etc/composer \
    && chown -R root:root /var/www/etc/composer \
    && chmod 775 /var/www/etc/composer \
    && rm -rf /root/.composer \
    && ln -sf /var/www/etc/composer /root/.composer

# Layer 05
# Prepare Nginx Configuration
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup \
    && cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.backup \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && mkdir -p /var/lib/nginx/body \
    && mkdir -p /var/www/etc/nginx \
    && mkdir -p /var/www/etc/nginx/sites-available \
    && mkdir -p /usr/share/docker/files/www \
    && chown -R root:root /dev/stdout \
    && chown -R root:root /dev/stderr \
    && chown -R root:root /var/lib/nginx \
    && chown -R root:root /var/lib/nginx/body \
    && chown -R root:root /var/www/etc/nginx \
    && chown -R root:root /var/www/etc/nginx/sites-available \
    && chown -R root:root /usr/share/docker/files \
    && chown -R root:root /usr/share/docker/files/www \
    && chown -R root:root /var/www/html \
    && chmod 664 /dev/stdout \
    && chmod 664 /dev/stderr \
    && chmod 757 /var/log/nginx \
    && chmod 646 /var/log/nginx/* \
    && chmod 775 /var/lib/nginx \
    && chmod 775 /var/lib/nginx/body \
    && chmod 775 /var/www/etc/nginx \
    && chmod 775 /var/www/etc/nginx/sites-available \
    && chmod 775 /usr/share/docker/files \
    && chmod 775 /usr/share/docker/files/www \
    && chmod 775 /var/www/html \
    && ln -sf /var/www/html /root/public_html

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
    && chmod 664 /etc/nginx/nginx.conf.docker \
    && chmod 664 /etc/nginx/sites-available/default.docker \
    && touch /run/nginx.pid \
    && cp /etc/nginx/nginx.conf.docker /etc/nginx/nginx.conf \
    && cp /etc/nginx/sites-available/default.docker /var/www/etc/nginx/sites-available/default \
    && chown root:root /run/nginx.pid \
    && chown root:root /etc/nginx/nginx.conf \
    && chown root:root /var/www/etc/nginx/sites-available/default \
    && chmod 664 /run/nginx.pid \
    && chmod 664 /etc/nginx/nginx.conf \
    && chmod 664 /var/www/etc/nginx/sites-available/default \
    && ln -sf /var/www/etc/nginx/sites-available/default /etc/nginx/sites-available/default

# Layer 08
# Prepare PHP Configuration
RUN cp /etc/php5/fpm/php.ini /etc/php5/fpm/php.ini.backup \
    && cp /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/wwww.conf.backup \
    && rm -f /var/log/php5-fpm.log \
    && touch /var/log/php5-fpm.log \
    && mkdir -p /var/lib/php/sessions \
    && mkdir -p /var/lib/php/uploads \
    && mkdir -p /var/www/etc/php5/fpm/pool.d \
    && chown -R root:root /var/log/php5-fpm.log \
    && chown -R root:root /var/lib/php/sessions \
    && chown -R root:root /var/lib/php/uploads \
    && chown -R root:root /var/www/etc/php5 \
    && chown -R root:root /var/www/etc/php5/fpm \
    && chown -R root:root /var/www/etc/php5/fpm/pool.d \
    && chmod 664 /var/log/php5-fpm.log \
    && chmod 770 /var/lib/php/sessions \
    && chmod 770 /var/lib/php/uploads \
    && chmod 775 /var/www/etc/php5 \
    && chmod 775 /var/www/etc/php5/fpm \
    && chmod 775 /var/www/etc/php5/fpm/pool.d

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
    && chmod 664 /etc/php5/fpm/php.ini.docker \
    && chmod 664 /etc/php5/fpm/pool.d/www.conf.docker \
    && touch /run/php5-fpm.pid \
    && cp /etc/php5/fpm/php.ini.docker /var/www/etc/php5/fpm/php.ini \
    && cp /etc/php5/fpm/pool.d/www.conf.docker /var/www/etc/php5/fpm/pool.d/www.conf \
    && chown root:root /run/php5-fpm.pid \
    && chown root:root /var/www/etc/php5/fpm/php.ini \
    && chown root:root /var/www/etc/php5/fpm/pool.d/www.conf \
    && chmod 664 /run/php5-fpm.pid \
    && chmod 664 /var/www/etc/php5/fpm/php.ini \
    && chmod 664 /var/www/etc/php5/fpm/pool.d/www.conf \
    && ln -sf /var/www/etc/php5/fpm/php.ini /etc/php5/fpm/php.ini \
    && ln -sf /var/www/etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf

# Layer 11
# Copy Default Web Content
COPY ./content/html/index.php /usr/share/docker/files/www/index.php
COPY ./content/html/info.php /usr/share/docker/files/www/info.php

# Layer 12
# Update Default Web Content
RUN rm -f /var/www/html/* \
    && chown root:root /usr/share/docker/files/www/index.php \
    && chown root:root /usr/share/docker/files/www/info.php \
    && chmod 664 /usr/share/docker/files/www/index.php \
    && chmod 664 /usr/share/docker/files/www/info.php \
    && cp /usr/share/docker/files/www/index.php /var/www/html/index.php \
    && cp /usr/share/docker/files/www/info.php /var/www/html/info.php \
    && chown root:root /var/www/html/index.php \
    && chown root:root /var/www/html/info.php \
    && chmod 664 /var/www/html/index.php \
    && chmod 664 /var/www/html/info.php

# Layer 13
# Copy Container Scripts
COPY ./entry/container-entrypoint /usr/local/bin/container-entrypoint
COPY ./entry/container-executor /usr/local/bin/container-executor

# Layer 14
# Change Container Scripts Permissions
RUN chmod 755 /usr/local/bin/container-entrypoint \
    && chmod 755 /usr/local/bin/container-executor

# Set Volumes Directory
VOLUME /var/www

# Set Environment Variables
ENV PATH $PATH:/root/.composer/vendor/bin

# Expose Ports
EXPOSE 8080

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/bin/container-entrypoint"]

# Set Executor Script
CMD ["/usr/local/bin/container-executor"]

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Nginx 1.6.2" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian Jessie (8.x) PHP 5.6 + Composer with Nginx 1.6.2" \
      io.k8s.display-name="Debian Jessie (8.x) PHP 5.6 + Composer with Nginx 1.6.2" \
      io.openshift.tags="builder,debian8,php56,nginx162" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
