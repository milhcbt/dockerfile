FROM dimaskiddo/alpine:base
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
        git \
    && rm -rf /var/cache/apk/*

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
