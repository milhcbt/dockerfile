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
RUN yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
      httpd \
      subversion \
      git \
    && yum clean all

# Layer 03
# Install PHP
RUN yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
      php \
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
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && chmod 755 /usr/local/bin/composer \
    && mkdir -p /var/www/etc/composer \
    && chown -R root:root /var/www/etc/composer \
    && chmod 775 /var/www/etc/composer \
    && rm -rf /root/.composer \
    && ln -sf /var/www/etc/composer /root/.composer

# Layer 05
# Prepare HttpD Configuration
RUN cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.backup \
    && cp /etc/httpd/conf.modules.d/00-base.conf /etc/httpd/conf.modules.d/00-base.conf.backup \
    && mkdir -p /var/www/etc/httpd/conf \
    && mkdir -p /var/www/etc/httpd/conf.modules.d \
    && mkdir -p /usr/share/docker/www \
    && chown -R root:root /var/www/etc/httpd/conf \
    && chown -R root:root /var/www/etc/httpd/conf.modules.d \
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
COPY ./config/httpd/conf.modules.d/00-base.conf /etc/httpd/conf.modules.d/00-base.conf.docker

# Layer 07
# Update HttpD Configuration
RUN rm -f /etc/httpd/conf/httpd.conf \
    && rm -f /etc/httpd/conf.modules.d/00-base.conf \
    && chown root:root /etc/httpd/conf/httpd.conf.docker \
    && chown root:root /etc/httpd/conf.modules.d/00-base.conf.docker \
    && chmod 664 /etc/httpd/conf/httpd.conf.docker \
    && chmod 664 /etc/httpd/conf.modules.d/00-base.conf.docker \
    && cp /etc/httpd/conf/httpd.conf.docker /var/www/etc/httpd/conf/httpd.conf \
    && cp /etc/httpd/conf.modules.d/00-base.conf.docker /var/www/etc/httpd/conf.modules.d/00-base.conf \
    && chown root:root /var/www/etc/httpd/conf/httpd.conf \
    && chown root:root /var/www/etc/httpd/conf.modules.d/00-base.conf \
    && chmod 664 /var/www/etc/httpd/conf/httpd.conf \
    && chmod 664 /var/www/etc/httpd/conf.modules.d/00-base.conf \
    && ln -sf /var/www/etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf \
    && ln -sf /var/www/etc/httpd/conf.modules.d/00-base.conf /etc/httpd/conf.modules.d/00-base.conf \
    && chgrp -R root /run/httpd* \
    && chmod -R ug+rwx /run/httpd*

# Layer 08
# Prepare PHP Configuration
RUN cp /etc/php.ini /etc/php.ini.backup \
    && mkdir -p /var/www/etc/php \
    && chown -R root:root /var/www/etc/php \
    && chmod 775 /var/www/etc/php

# Layer 09
# Copy Pre-Configured PHP Apache Configuration File
COPY ./config/php/php.ini /etc/php.ini.docker

# Layer 10
# Update PHP Configuration
RUN rm -f /etc/php.ini \
    && chown root:root /etc/php.ini.docker \
    && chmod 664 /etc/php.ini.docker \
    && cp /etc/php.ini.docker /var/www/etc/php/php.ini \
    && chown root:root /var/www/etc/php/php.ini \
    && chmod 664 /var/www/etc/php/php.ini \
    && ln -sf /var/www/etc/php/php.ini /etc/php.ini

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
