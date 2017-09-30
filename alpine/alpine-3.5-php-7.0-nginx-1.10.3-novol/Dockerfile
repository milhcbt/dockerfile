FROM dimaskiddo/alpine:3.5
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Run Some Housekeeping
RUN mkdir -p /var/www/data/html \
    && mkdir -p /var/www/data/etc \
    && chown root:root /var/www/data \
    && chown root:root /var/www/data/html \
    && chown root:root /var/www/data/etc \
    && chmod 775 /var/www/data \
    && chmod 775 /var/www/data/html \
    && chmod 775 /var/www/data/etc \
    && cp /etc/apk/repositories /etc/apk/repositories.backup \
    && rm -f /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories \
    && chmod 644 /etc/apk/repositories

# Layer 02
# Install Apache and SCM
RUN apk update \
    && apk add \
        nginx \
        subversion \
        git \
    && rm -rf /var/cache/apk/*

# Layer 03
# Install PHP
RUN apk update \
    && apk add \
        php7-common \
        php7-pear \
        php7-bcmath \
        php7-bz2 \
        php7-cli \
        php7-calendar \
        php7-curl \
        php7-ctype \
        php7-dom \
        php7-exif \
        php7-ftp \
        php7-gd \
        php7-gettext \
        php7-iconv \
        php7-imagick \
        php7-intl \
        php7-imap \
        php7-ldap \
        php7-json \
        php7-mcrypt \
        php7-memcached \
        php7-opcache \
        php7-pcntl \
        php7-phar \
        php7-posix \
        php7-pspell \
        php7-mysqlnd \
        php7-mysqli \
        php7-pgsql \
        php7-sqlite3 \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-openssl \
        php7-sockets \
        php7-soap \
        php7-sysvshm \
        php7-sysvmsg \
        php7-sysvsem \
        php7-tokenizer \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-xmlrpc \
        php7-xsl \
        php7-zlib \
        php7-zip \
        php7-fpm \
    && rm -rf /var/cache/apk/*

# Layer 04
# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod 755 /usr/local/bin/composer \
    && mkdir -p /var/www/data/etc/composer \
    && chown -R root:root /var/www/data/etc/composer \
    && chmod 775 /var/www/data/etc/composer \
    && rm -rf /root/.composer \
    && ln -sf /var/www/data/etc/composer /root/.composer

# Layer 05
# Prepare Nginx Configuration
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && mkdir -p /var/lib/nginx/tmp/client_body \
    && mkdir -p /var/tmp/nginx/proxy \
    && mkdir -p /var/tmp/nginx/fastcgi \
    && mkdir -p /var/tmp/nginx/uwsgi \
    && mkdir -p /var/tmp/nginx/scgi \
    && mkdir -p /var/www/data/etc/nginx \
    && mkdir -p /var/www/data/etc/nginx/conf.d \
    && mkdir -p /usr/share/docker/files/www \
    && chown -R root:root /dev/stdout \
    && chown -R root:root /dev/stderr \
    && chown -R root:root /var/lib/nginx \
    && chown -R root:root /var/lib/nginx/tmp \
    && chown -R root:root /var/lib/nginx/tmp/client_body \
    && chown -R root:root /var/tmp/nginx \
    && chown -R root:root /var/tmp/nginx/proxy \
    && chown -R root:root /var/tmp/nginx/fastcgi \
    && chown -R root:root /var/tmp/nginx/uwsgi \
    && chown -R root:root /var/tmp/nginx/scgi \
    && chown -R root:root /var/www/data/etc/nginx \
    && chown -R root:root /var/www/data/etc/nginx/conf.d \
    && chown -R root:root /usr/share/docker/files \
    && chown -R root:root /usr/share/docker/files/www \
    && chown -R root:root /var/www/data/html \
    && chmod 664 /dev/stdout \
    && chmod 664 /dev/stderr \
    && chmod 757 /var/log/nginx \
    && chmod 646 /var/log/nginx/* \
    && chmod 775 /var/lib/nginx \
    && chmod 775 /var/lib/nginx/tmp \
    && chmod 775 /var/lib/nginx/tmp/client_body \
    && chmod 755 /var/tmp/nginx/ \
    && chmod 755 /var/tmp/nginx/proxy \
    && chmod 755 /var/tmp/nginx/fastcgi \
    && chmod 755 /var/tmp/nginx/uwsgi \
    && chmod 755 /var/tmp/nginx/scgi \
    && chmod 775 /var/www/data/etc/nginx \
    && chmod 775 /var/www/data/etc/nginx/conf.d \
    && chmod 775 /usr/share/docker/files \
    && chmod 775 /usr/share/docker/files/www \
    && chmod 775 /var/www/data/html \
    && ln -sf /var/www/data/html /root/public_html

# Layer 06
# Copy Pre-Configured Nginx Configuration File
COPY ./config/nginx/nginx.conf /etc/nginx/nginx.conf.docker
COPY ./config/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.docker

# Layer 07
# Update Nginx Configuration
RUN rm -rf /var/www/localhost \
    && rm -f /etc/nginx/nginx.conf \
    && chown root:root /etc/nginx/nginx.conf.docker \
    && chown root:root /etc/nginx/conf.d/default.conf.docker \
    && chmod 664 /etc/nginx/nginx.conf.docker \
    && chmod 664 /etc/nginx/conf.d/default.conf.docker \
    && touch /run/nginx.pid \
    && cp /etc/nginx/nginx.conf.docker /etc/nginx/nginx.conf \
    && cp /etc/nginx/conf.d/default.conf.docker /var/www/data/etc/nginx/conf.d/default.conf \
    && chown root:root /run/nginx.pid \
    && chown root:root /etc/nginx/nginx.conf \
    && chown root:root /var/www/data/etc/nginx/conf.d/default.conf \
    && chmod 664 /run/nginx.pid \
    && chmod 664 /etc/nginx/nginx.conf \
    && chmod 664 /var/www/data/etc/nginx/conf.d/default.conf \
    && ln -sf /var/www/data/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

# Layer 08
# Prepare PHP Configuration
RUN cp /etc/php7/php.ini /etc/php7/php.ini.backup \
    && cp /etc/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.conf.backup \
    && mkdir -p /var/lib/php \
    && rm -rf /var/lib/php/* \
    && touch /var/log/php7/error.log \
    && mkdir -p /var/www/data/etc/php7 \
    && mkdir -p /var/www/data/etc/php7/php-fpm.d \
    && chown -R root:root /var/lib/php \
    && chown -R root:root /var/log/php7/error.log \
    && chown -R root:root /var/www/data/etc/php7 \
    && chown -R root:root /var/www/data/etc/php7/php-fpm.d \
    && chmod 775 /var/lib/php \
    && chmod 664 /var/log/php7/error.log \
    && chmod 775 /var/www/data/etc/php7 \
    && chmod 775 /var/www/data/etc/php7/php-fpm.d

# Layer 09
# Copy Pre-Configured PHP Apache Configuration File
COPY ./config/php7/php.ini /etc/php7/php.ini.docker
COPY ./config/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.conf.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php7/php.ini \
    && rm -f /etc/php7/php-fpm.d/www.conf \
    && chown root:root /etc/php7/php.ini.docker \
    && chown root:root /etc/php7/php-fpm.d/www.conf.docker \
    && chmod 664 /etc/php7/php.ini.docker \
    && chmod 664 /etc/php7/php-fpm.d/www.conf.docker \
    && cp /etc/php7/php.ini.docker /var/www/data/etc/php7/php.ini \
    && cp /etc/php7/php-fpm.d/www.conf.docker /var/www/data/etc/php7/php-fpm.d/www.conf \
    && chown root:root /var/www/data/etc/php7/php.ini \
    && chown root:root /var/www/data/etc/php7/php-fpm.d/www.conf \
    && chmod 664 /var/www/data/etc/php7/php.ini \
    && chmod 664 /var/www/data/etc/php7/php-fpm.d/www.conf \
    && ln -sf /var/www/data/etc/php7/php.ini /etc/php7/php.ini \
    && ln -sf /var/www/data/etc/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.conf

# Layer 11
# Copy Default Web Content
COPY ./content/html/index.php /usr/share/docker/files/www/index.php
COPY ./content/html/info.php /usr/share/docker/files/www/info.php

# Layer 12
# Update Default Web Content
RUN rm -f /var/www/data/html/* \
    && chown root:root /usr/share/docker/files/www/index.php \
    && chown root:root /usr/share/docker/files/www/info.php \
    && chmod 664 /usr/share/docker/files/www/index.php \
    && chmod 664 /usr/share/docker/files/www/info.php \
    && cp /usr/share/docker/files/www/index.php /var/www/data/html/index.php \
    && cp /usr/share/docker/files/www/info.php /var/www/data/html/info.php \
    && chown root:root /var/www/data/html/index.php \
    && chown root:root /var/www/data/html/info.php \
    && chmod 664 /var/www/data/html/index.php \
    && chmod 664 /var/www/data/html/info.php

# Layer 13
# Copy Container Scripts
COPY ./entry/container-entrypoint /usr/local/bin/container-entrypoint
COPY ./entry/container-executor /usr/local/bin/container-executor

# Layer 14
# Change Container Scripts Permissions
RUN chmod 755 /usr/local/bin/container-entrypoint \
    && chmod 755 /usr/local/bin/container-executor

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
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Nginx 1.10.3" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) PHP 7.0 + Composer with Nginx 1.10.3" \
      io.k8s.display-name="Alpine (3.x) PHP 7.0 + Composer with Nginx 1.10.3" \
      io.openshift.tags="builder,alpine3,php70,nginx1103" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
