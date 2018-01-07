FROM dimaskiddo/alpine:base
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
    && chmod 775 /var/www/data/etc

# Layer 02
# Install Apache and SCM
RUN apk update \
    && apk add \
        nginx \
        git \
    && rm -rf /var/cache/apk/*

# Layer 05
# Prepare Nginx Configuration
RUN cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && mkdir -p /var/lib/nginx/tmp/client_body \
    && mkdir -p /var/www/data/etc/nginx \
    && mkdir -p /var/www/data/etc/nginx/conf.d \
    && mkdir -p /usr/share/docker/files/www \
    && chown -R root:root /dev/stdout \
    && chown -R root:root /dev/stderr \
    && chown -R root:root /var/lib/nginx \
    && chown -R root:root /var/lib/nginx/tmp \
    && chown -R root:root /var/lib/nginx/tmp/client_body \
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
      summary="Virtual Machine (VM) like container platform for running PHP 5.6 applications with Nginx 1.10.3" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) PHP 5.6 + Composer with Nginx 1.10.3" \
      io.k8s.display-name="Alpine (3.x) PHP 5.6 + Composer with Nginx 1.10.3" \
      io.openshift.tags="builder,alpine3,php56,nginx1103" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
