FROM dimaskiddo/debian:php-7.1-nginx-novol
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/www

# Change Working User to "Root"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="Virtual Machine (VM) like container platform with Nginx 1.14.2 & PHP 7.1 + PHP Microsoft SQL Server" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian (8.x) with Nginx 1.14.2 & PHP 7.1 + PHP Microsoft SQL Server" \
      io.k8s.display-name="Debian (8.x) with Nginx 1.14.2 & PHP 7.1 + PHP Microsoft SQL Server" \
      io.openshift.tags="builder,debian,nginx,php,php-mssql" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
