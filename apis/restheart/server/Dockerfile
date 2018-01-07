FROM dimaskiddo/alpine:openjre-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV RESTHEART_VERSION 3.2.0

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/www/data

# Expose Ports
EXPOSE 8009 8080 8443

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["/usr/bin/supervisord","-n","-c","/var/www/data/etc/supervisor/supervisord.conf","-d","/var/www/data/etc/supervisor"]

# Change Working User to "Root"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with RESTHeart" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with RESTHeart" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with RESTHeart" \
      io.openshift.tags="builder,alpine,openjre,restheart" \
      io.openshift.expose-services="8009:ajp-listener,8080:http,8443:https" \
      io.openshift.non-scalable="false"
