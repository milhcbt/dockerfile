FROM dimaskiddo/alpine:openjre-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV TOMCAT_MAJOR=7 \
    TOMCAT_VERSION=7.0.82 \
    CATALINA_HOME=/opt/tomcat \
    PATH=$PATH:/opt/tomcat/bin

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/www/data

# Expose Ports
EXPOSE 8080 8443

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["/usr/bin/supervisord","-n","-c","/var/www/data/etc/supervisor/supervisord.conf","-d","/var/www/data/etc/supervisor"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform for running Java web applications with Tomcat 7.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 7.0" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 7.0" \
      io.openshift.tags="builder,alpine3,openjre8,tomcat70" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
