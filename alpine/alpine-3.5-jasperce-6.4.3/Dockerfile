FROM dimaskiddo/alpine:tomcat-8.5-openjre-novol
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV JS_VERSION=6.4.3 \
    JS_HOME=/opt/jasper-ce \
    JS_BUILD=/opt/jasper-ce/buildomatic \
    JS_XMX=2G \
    JS_MAXPERMSIZE=256m \
    JS_CATALINA_OPTS="-XX:+UseBiasedLocking -XX:BiasedLockingStartupDelay=0 -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+DisableExplicitGC -XX:+CMSIncrementalMode -XX:+CMSIncrementalPacing -XX:+CMSParallelRemarkEnabled -XX:+UseCompressedOops -XX:+UseCMSInitiatingOccupancyOnly"

# Change Working User to "Root"
USER root

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/www/data

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with Tomcat 8.5 & Jasper Reports Server 6.4.2" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 8.5 & Jasper Reports Server 6.4.2" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 8.5 & Jasper Reports Server 6.4.2" \
      io.openshift.tags="builder,alpine,openjre,tomcat,jasperce" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
