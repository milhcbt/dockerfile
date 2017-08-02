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
# Install HttpD and SCM
RUN yum -y --disableplugin=fastestmirror,ovl --setopt=tsflags=nodocs install \
      httpd \
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
# Prepare HttpD Configuration
RUN cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.backup \
    && mkdir -p /var/www/etc/httpd/conf \
    && mkdir -p /usr/share/docker/www \
    && chown -R root:root /var/www/etc/httpd/conf \
    && chown -R root:root /usr/share/docker/www \
    && chown -R root:root /var/www/html \
    && chmod 757 /var/log/httpd \
    && chmod 775 /var/www/etc/httpd/conf \
    && chmod 775 /usr/share/docker/www \
    && chmod 775 /var/www/html \
    && ln -sf /var/www/html /root/public_html

# Layer 06
# Copy Pre-Configured HttpD Configuration File
COPY ./config/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.docker
COPY ./config/httpd/conf.d/php.conf /etc/httpd/conf.d/php.conf
COPY ./config/httpd/conf.modules.d/00-base.conf /etc/httpd/conf.modules.d/00-base.conf

# Layer 07
# Update HttpD Configuration
RUN rm -f /etc/httpd/conf/httpd.conf \
    && chown root:root /etc/httpd/conf/httpd.conf.docker \
    && chmod 664 /etc/httpd/conf/httpd.conf.docker \
    && cp /etc/httpd/conf/httpd.conf.docker /var/www/etc/httpd/conf/httpd.conf \
    && chown root:root /var/www/etc/httpd/conf/httpd.conf \
    && chmod 664 /var/www/etc/httpd/conf/httpd.conf \
    && ln -sf /var/www/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf \
    && chgrp -R root /run/httpd* \
    && chmod -R ug+rwx /run/httpd*

# Layer 08
# Prepare PHP Configuration
RUN cp /etc/php.ini /etc/php.ini.backup \
    && cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/wwww.conf.backup \
    && touch /var/log/php-fpm/error.log \
    && mkdir -p /var/lib/php/sessions \
    && mkdir -p /var/lib/php/uploads \
    && mkdir -p /var/www/etc/php/php-fpm.d \
    && chown -R root:root /var/log/php-fpm/error.log \
    && chown -R root:root /var/lib/php/sessions \
    && chown -R root:root /var/lib/php/uploads \
    && chown -R root:root /var/lib/php/wsdlcache \
    && chown -R root:root /var/www/etc/php \
    && chown -R root:root /var/www/etc/php/php-fpm.d \
    && chmod 664 /var/log/php-fpm/error.log \
    && chmod 770 /var/lib/php/sessions \
    && chmod 770 /var/lib/php/uploads \
    && chmod 770 /var/lib/php/wsdlcache \
    && chmod 775 /var/www/etc/php \
    && chmod 775 /var/www/etc/php/php-fpm.d

# Layer 09
# Copy Pre-Configured PHP Apache Configuration File
COPY ./config/php/php.ini /etc/php.ini.docker
COPY ./config/php/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.docker

# Layer 10
# Update PHP Configuration
RUN rm -rf /var/lib/php/session \
    && rm -f /etc/php.ini \
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
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Apache 2.4" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="CentOS (7.x) PHP 5.6 + Composer with Apache 2.4" \
      io.k8s.display-name="CentOS (7.x) PHP 5.6 + Composer with Apache 2.4" \
      io.openshift.tags="builder,centos7,php56,apache24" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
