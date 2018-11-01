FROM dimaskiddo/alpine:openjre-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV TOMCAT_MAJOR=7 \
    TOMCAT_VERSION=7.0.91 \
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
CMD ["sh","-c","$CATALINA_HOME/bin/catalina.sh run $ARGS"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with Tomcat 7.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 7.0" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 7.0" \
      io.openshift.tags="builder,alpine,openjre,tomcat" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
