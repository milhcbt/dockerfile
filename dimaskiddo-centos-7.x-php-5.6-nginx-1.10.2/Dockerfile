FROM dimaskiddo/centos:7.x
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Run Some Housekeeping
RUN mkdir -p /var/www/etc \
    && chown root:root /var/www \
    && chown root:root /var/www/etc \
    && chmod 775 /var/www \
    && chmod 775 /var/www/etc

# Layer 02
# Install Nginx and SCM
RUN yum -y --disableplugin=fastestmirror,ovl --setopt=tsflags=nodocs install \
      nginx \
      subversion \
      git \
    && yum clean all

# Layer 03
# Install PHP
RUN yum -y --disableplugin=fastestmirror,ovl --setopt=tsflags=nodocs install \
      php-fpm \
      php-pear \
      php-curl \
      php-gd \
      php-intl \
      php-imagick \
      php-imap \
      php-mcrypt \
      php-memcache \
      php-pspell \
      php-recode \
      php-opcache \
      php-suhosin \
      php-mongo \
      php-mysqlnd \
      php-pgsql \
      php-sqlite \
      php-tidy \
      php-xmlrpc \
      php-xsl \
    && yum clean all \
    && echo "suhosin.executor.include.whitelist = phar" >> /etc/php.d/40-suhosin.ini

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
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && mkdir -p /var/lib/nginx/tmp/client_body \
    && mkdir -p /var/www/etc/nginx \
    && mkdir -p /var/www/etc/nginx/conf.d \
    && mkdir -p /usr/share/docker/files/www \
    && chown -R root:root /dev/stdout \
    && chown -R root:root /dev/stderr \
    && chown -R root:root /var/lib/nginx \
    && chown -R root:root /var/lib/nginx/tmp \
    && chown -R root:root /var/lib/nginx/tmp/client_body \
    && chown -R root:root /var/www/etc/nginx \
    && chown -R root:root /var/www/etc/nginx/conf.d \
    && chown -R root:root /usr/share/docker/files \
    && chown -R root:root /usr/share/docker/files/www \
    && chown -R root:root /var/www/html \
    && chmod 664 /dev/stdout \
    && chmod 664 /dev/stderr \
    && chmod 757 /var/log/nginx \
    && chmod 646 /var/log/nginx/* \
    && chmod 775 /var/lib/nginx \
    && chmod 775 /var/lib/nginx/tmp \
    && chmod 775 /var/lib/nginx/tmp/client_body \
    && chmod 775 /var/www/etc/nginx \
    && chmod 775 /var/www/etc/nginx/conf.d \
    && chmod 775 /usr/share/docker/files \
    && chmod 775 /usr/share/docker/files/www \
    && chmod 775 /var/www/html \
    && ln -sf /var/www/html /root/public_html

# Layer 06
# Copy Pre-Configured Nginx Configuration File
COPY ./config/nginx/nginx.conf /etc/nginx/nginx.conf.docker
COPY ./config/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.docker

# Layer 07
# Update Nginx Configuration
RUN rm -f /etc/nginx/nginx.conf \
    && chown root:root /etc/nginx/nginx.conf.docker \
    && chown root:root /etc/nginx/conf.d/default.conf.docker \
    && chmod 664 /etc/nginx/nginx.conf.docker \
    && chmod 664 /etc/nginx/conf.d/default.conf.docker \
    && touch /run/nginx.pid \
    && cp /etc/nginx/nginx.conf.docker /etc/nginx/nginx.conf \
    && cp /etc/nginx/conf.d/default.conf.docker /var/www/etc/nginx/conf.d/default.conf \
    && chown root:root /run/nginx.pid \
    && chown root:root /etc/nginx/nginx.conf \
    && chown root:root /var/www/etc/nginx/conf.d/default.conf \
    && chmod 664 /run/nginx.pid \
    && chmod 664 /etc/nginx/nginx.conf \
    && chmod 664 /var/www/etc/nginx/conf.d/default.conf \
    && ln -sf /var/www/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

# Layer 08
# Prepare PHP Configuration
RUN cp /etc/php.ini /etc/php.ini.backup \
    && cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/wwww.conf.backup \
    && touch /var/log/php-fpm/error.log \
    && mkdir -p /var/lib/php/session \
    && mkdir -p /var/lib/php/upload \
    && mkdir -p /var/www/etc/php/php-fpm.d \
    && chown -R root:root /var/log/php-fpm/error.log \
    && chown -R root:root /var/lib/php/session \
    && chown -R root:root /var/lib/php/upload \
    && chown -R root:root /var/lib/php/wsdlcache \
    && chown -R root:root /var/www/etc/php \
    && chown -R root:root /var/www/etc/php/php-fpm.d \
    && chmod 664 /var/log/php-fpm/error.log \
    && chmod 770 /var/lib/php/session \
    && chmod 770 /var/lib/php/upload \
    && chmod 770 /var/lib/php/wsdlcache \
    && chmod 775 /var/www/etc/php \
    && chmod 775 /var/www/etc/php/php-fpm.d

# Layer 09
# Copy Pre-Configured PHP FPM Configuration File
COPY ./config/php/php.ini /etc/php.ini.docker
COPY ./config/php/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php.ini \
    && rm -f /etc/php-fpm.d/www.conf \
    && chown root:root /etc/php.ini.docker \
    && chown root:root /etc/php-fpm.d/www.conf.docker \
    && chmod 664 /etc/php.ini.docker \
    && chmod 664 /etc/php-fpm.d/www.conf.docker \
    && touch /run/php-fpm/php-fpm.pid \
    && cp /etc/php.ini.docker /var/www/etc/php/php.ini \
    && cp /etc/php-fpm.d/www.conf.docker /var/www/etc/php/php-fpm.d/www.conf \
    && chown root:root /run/php-fpm/php-fpm.pid \
    && chown root:root /var/www/etc/php/php.ini \
    && chown root:root /var/www/etc/php/php-fpm.d/www.conf \
    && chmod 664 /run/php-fpm/php-fpm.pid \
    && chmod 664 /var/www/etc/php/php.ini \
    && chmod 664 /var/www/etc/php/php-fpm.d/www.conf \
    && ln -sf /var/www/etc/php/php.ini /etc/php.ini \
    && ln -sf /var/www/etc/php/php-fpm.d/www.conf /etc/php-fpm.d/www.conf

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
      vendor="CentOS" \
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Nginx 1.10.2" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="CentOS (7.x) PHP 5.6 + Composer with Nginx 1.10.2" \
      io.k8s.display-name="CentOS (7.x) PHP 5.6 + Composer with Nginx 1.10.2" \
      io.openshift.tags="builder,centos7,php56,nginx1102" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
