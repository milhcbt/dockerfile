FROM dimaskiddo/alpine:nginx-1.12.2-novol
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV SWAGGERUI_VERSION 2.2.10

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
      summary="Virtual Machine (VM) like container platform with Nginx 1.12.2 & Swagger UI 2.2.10" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with Nginx 1.12.2 & Swagger UI 2.2.10" \
      io.k8s.display-name="Alpine (3.x) with Nginx 1.12.2 & Swagger UI 2.2.10" \
      io.openshift.tags="builder,alpine,nginx,swaggerui" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
