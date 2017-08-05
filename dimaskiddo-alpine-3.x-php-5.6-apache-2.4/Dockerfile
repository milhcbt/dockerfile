FROM dimaskiddo/alpine:3.x
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Run Some Housekeeping
RUN mkdir -p /var/www/data/html \
    && mkdir -p /var/www/data/cgi-bin \
    && mkdir -p /var/www/data/etc \
    && chown root:root /var/www/data \
    && chown root:root /var/www/data/html \
    && chown root:root /var/www/data/cgi-bin \
    && chown root:root /var/www/data/etc \
    && chmod 775 /var/www/data \
    && chmod 775 /var/www/data/html \
    && chmod 775 /var/www/data/cgi-bin \
    && chmod 775 /var/www/data/etc

# Layer 02
# Install Apache and SCM
RUN apk update \
    && apk add \
        apache2 \
        apache2-utils \
        apache2-proxy \
        subversion \
        git \
    && rm -rf /var/cache/apk/*

# Layer 03
# Install PHP
RUN apk update \
    && apk add \
        php5-common \
        php5-pear \
        php5-bcmath \
        php5-bz2 \
        php5-cli \
        php5-calendar \
        php5-curl \
        php5-ctype \
        php5-dom \
        php5-exif \
        php5-ftp \
        php5-gd \
        php5-gettext \
        php5-iconv \
        php5-imagick \
        php5-intl \
        php5-imap \
        php5-ldap \
        php5-json \
        php5-mcrypt \
        php5-memcache \
        php5-opcache \
        php5-pcntl \
        php5-phar \
        php5-posix \
        php5-pspell \
        php5-mysql \
        php5-mysqli \
        php5-pgsql \
        php5-sqlite3 \
        php5-pdo \
        php5-pdo_mysql \
        php5-pdo_pgsql \
        php5-pdo_sqlite \
        php5-openssl \
        php5-sockets \
        php5-soap \
        php5-sysvshm \
        php5-sysvmsg \
        php5-sysvsem \
        php5-xml \
        php5-xmlreader \
        php5-xmlrpc \
        php5-xsl \
        php5-zlib \
        php5-zip \
        php5-fpm \
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
# Prepare Apache Configuration
RUN cp /etc/apache2/httpd.conf /etc/apache2/httpd.conf.backup \
    && mkdir -p /run/apache2 \
    && mkdir -p /var/www/data/etc/apache2 \
    && mkdir -p /usr/share/docker/files/www \
    && chown -R root:root /run \
    && chown -R root:root /run/apache2 \
    && chown -R root:root /var/www/data/etc/apache2 \
    && chown -R root:root /usr/share/docker/files \
    && chown -R root:root /usr/share/docker/files/www \
    && chmod 757 /var/log/apache2 \
    && chmod 775 /run \
    && chmod 775 /run/apache2 \
    && chmod 775 /var/www/data/etc/apache2 \
    && chmod 775 /usr/share/docker/files \
    && chmod 775 /usr/share/docker/files/www \
    && ln -sf /var/www/data/html /root/public_html

# Layer 06
# Copy Pre-Configured Apache Configuration File
COPY ./config/apache2/httpd.conf /etc/apache2/httpd.conf.docker

# Layer 07
# Update Apache Configuration
RUN rm -rf /var/www/localhost \
    && rm -f /etc/apache2/httpd.conf \
    && chown root:root /etc/apache2/httpd.conf.docker \
    && chmod 664 /etc/apache2/httpd.conf.docker \
    && cp /etc/apache2/httpd.conf.docker /var/www/data/etc/apache2/httpd.conf \
    && chown root:root /var/www/data/etc/apache2/httpd.conf \
    && chmod 664 /var/www/data/etc/apache2/httpd.conf \
    && ln -sf /var/www/data/etc/apache2/httpd.conf /etc/apache2/httpd.conf \
    && chgrp -R root /run /var/run /var/lock \
    && chmod -R ug+rwx /run /var/run /var/lock

# Layer 08
# Prepare PHP Configuration
RUN cp /etc/php5/php.ini /etc/php5/php.ini.backup \
    && cp /etc/php5/php-fpm.conf /etc/php5/php-fpm.conf.backup \
    && touch /var/log/php-fpm.log \
    && mkdir -p /var/lib/php/sessions \
    && mkdir -p /var/lib/php/uploads \
    && mkdir -p /var/www/data/etc/php5 \
    && chown -R root:root /var/log/php-fpm.log \
    && chown -R root:root /var/lib/php \
    && chown -R root:root /var/lib/php/sessions \
    && chown -R root:root /var/lib/php/uploads \
    && chown -R root:root /var/www/data/etc/php5 \
    && chmod 664 /var/log/php-fpm.log \
    && chmod 775 /var/lib/php \
    && chmod 770 /var/lib/php/sessions \
    && chmod 770 /var/lib/php/uploads \
    && chmod 775 /var/www/data/etc/php5

# Layer 09
# Copy Pre-Configured PHP Apache Configuration File
COPY ./config/php5/php.ini /etc/php5/php.ini.docker
COPY ./config/php5/php-fpm.conf /etc/php5/php-fpm.conf.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php5/php.ini \
    && rm -f /etc/php5/php-fpm.conf \
    && chown root:root /etc/php5/php.ini.docker \
    && chown root:root /etc/php5/php-fpm.conf.docker \
    && chmod 664 /etc/php5/php.ini.docker \
    && chmod 664 /etc/php5/php-fpm.conf.docker \
    && cp /etc/php5/php.ini.docker /var/www/data/etc/php5/php.ini \
    && cp /etc/php5/php-fpm.conf.docker /var/www/data/etc/php5/php-fpm.conf \
    && chown root:root /var/www/data/etc/php5/php.ini \
    && chown root:root /var/www/data/etc/php5/php-fpm.conf \
    && chmod 664 /var/www/data/etc/php5/php.ini \
    && chmod 664 /var/www/data/etc/php5/php-fpm.conf \
    && ln -sf /var/www/data/etc/php5/php.ini /etc/php5/php.ini \
    && ln -sf /var/www/data/etc/php5/php-fpm.conf /etc/php5/php-fpm.conf

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

# Set Volumes Directory
VOLUME /var/www/data

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
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Apache 2.4" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) PHP 5.6 + Composer with Apache 2.4" \
      io.k8s.display-name="Alpine (3.x) PHP 5.6 + Composer with Apache 2.4" \
      io.openshift.tags="builder,alpine3,php56,apache24" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
