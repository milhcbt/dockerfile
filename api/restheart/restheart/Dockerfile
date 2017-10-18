FROM dimaskiddo/ubuntu-oraclejre:xenial-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV RESTHEART_VERSION 3.1.4 

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Expose Ports
EXPOSE 8009 8080 8443

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["/usr/bin/supervisord","-n","-c","/var/www/etc/supervisor/supervisord.conf","-d","/var/www/etc/supervisor"]

# Change Working User to "Root"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Ubuntu" \
      summary="Virtual Machine (VM) like container platform for running RESTHeart" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Ubuntu Xenial (16.04) Oracle JRE 8.0 with RESTHeart" \
      io.k8s.display-name="Ubuntu Xenial (16.04) Oracle JRE 8.0 with RESTHeart" \
      io.openshift.tags="vmlike,ubuntu,oraclejre,restheart" \
      io.openshift.expose-services="8009:ajp-listener,8080:http,8443:https" \
      io.openshift.non-scalable="false"
