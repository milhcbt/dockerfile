FROM dimaskiddo/debian:8.9
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Run Some Housekeeping
RUN mkdir -p /var/www/etc \
    && chown root:root /var/www \
    && chown root:root /var/www/etc \
    && chmod 775 /var/www \
    && chmod 775 /var/www/etc

# Layer 02
# Install Apache and SCM
RUN apt-get -y update \
    && apt-get -y install \
        apache2 \
        libapache2-mod-fastcgi \
        subversion \
        git \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && a2dismod fastcgi \
    && a2enmod proxy_fcgi \
    && a2enmod rewrite

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
      php5-mongo \
      php5-mysqlnd \
      php5-pgsql \
      php5-sqlite \
      php5-tidy \
      php5-xmlrpc \
      php5-xsl \
      php5-fpm \
    && apt-get -y autoremove \
    && apt-get -y clean

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
# Prepare Apache Configuration
RUN cp /etc/apache2/ports.conf /etc/apache2/ports.conf.backup \
    && cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.backup \
    && unlink /etc/apache2/sites-enabled/000-default.conf \
    && mkdir -p /var/www/etc/apache2 \
    && mkdir -p /usr/share/docker/files/www \
    && chown -R root:root /var/www/etc/apache2 \
    && chown -R root:root /usr/share/docker/files \
    && chown -R root:root /usr/share/docker/files/www \
    && chown -R root:root /var/www/html \
    && chmod 757 /var/log/apache2 \
    && chmod 646 /var/log/apache2/* \
    && chmod 775 /var/www/etc/apache2 \
    && chmod 775 /usr/share/docker/files \
    && chmod 775 /usr/share/docker/files/www \
    && chmod 775 /var/www/html \
    && ln -sf /var/www/html /root/public_html

# Layer 06
# Copy Pre-Configured Apache Configuration File
COPY ./config/apache2/apache2.conf /etc/apache2/apache2.conf.docker
COPY ./config/apache2/ports.conf /etc/apache2/ports.conf.docker

# Layer 07
# Update Apache Configuration
RUN rm -f /etc/apache2/apache2.conf \
    && rm -f /etc/apache2/ports.conf \
    && chown root:root /etc/apache2/apache2.conf.docker \
    && chown root:root /etc/apache2/ports.conf.docker \
    && chmod 664 /etc/apache2/apache2.conf.docker \
    && chmod 664 /etc/apache2/ports.conf.docker \
    && cp /etc/apache2/apache2.conf.docker /var/www/etc/apache2/apache2.conf \
    && cp /etc/apache2/ports.conf.docker /etc/apache2/ports.conf \
    && chown root:root /var/www/etc/apache2/apache2.conf \
    && chown root:root /etc/apache2/ports.conf \
    && chmod 664 /var/www/etc/apache2/apache2.conf \
    && chmod 664 /etc/apache2/ports.conf \
    && ln -sf /var/www/etc/apache2/apache2.conf /etc/apache2/apache2.conf \
    && chgrp -R root /var/run/apache2* /var/lock/apache2* \
    && chmod -R ug+rwx /var/run/apache2* /var/lock/apache2*

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
# Copy Pre-Configured PHP Apache Configuration File
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
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Apache 2.4" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian Jessie (8.x) PHP 5.6 + Composer with Apache 2.4" \
      io.k8s.display-name="Debian Jessie (8.x) PHP 5.6 + Composer with Apache 2.4" \
      io.openshift.tags="builder,debian8,php56,apache24" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
