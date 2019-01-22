FROM dimaskiddo/debian:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/www

# Expose Ports
EXPOSE 8080 8443

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["/usr/bin/supervisord","-n","-c","/var/www/etc/supervisor/supervisord.conf","-d","/var/www/etc/supervisor"]

# Change Working User to "Root"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="Virtual Machine (VM) like container platform with Apache 2.4" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian (8.x) with Apache 2.4" \
      io.k8s.display-name="Debian (8.x) with Apache 2.4" \
      io.openshift.tags="builder,debian,apache" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
