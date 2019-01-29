FROM dimaskiddo/debian:nginx-1.14.2-novol
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV PATH $PATH:/root/.composer/vendor/bin

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
      summary="Virtual Machine (VM) like container platform with Nginx 1.14.2 & PHP 5.6" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian (8.x) with Nginx 1.14.2 & PHP 5.6" \
      io.k8s.display-name="Debian (8.x) with Nginx 1.14.2 & PHP 5.6" \
      io.openshift.tags="builder,debian,nginx,php" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
