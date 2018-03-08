FROM dimaskiddo/alpine:tomcat-8.5-novol
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV JS_VERSION=6.4.2 \
    JS_HOME=/opt/jasper-ce \
    JS_BUILD=/opt/jasper-ce/buildomatic \
    JS_XMX=1024m \
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
