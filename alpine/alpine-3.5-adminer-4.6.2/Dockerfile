FROM dimaskiddo/alpine:php-5.6-nginx-novol
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV ADMINER_VERSION=4.6.2 \
    PHP_MONGO_VERSION=1.6.16-r0

# Change Working User to "Root"
USER root

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with Adminer 4.6.2" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with Adminer 4.6.2" \
      io.k8s.display-name="Alpine (3.x) with Adminer 4.6.2" \
      io.openshift.tags="builder,alpine,nginx,php,adminer" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
