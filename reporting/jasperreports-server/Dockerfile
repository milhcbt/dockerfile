FROM dimaskiddo/ubuntu-oraclejre-tomcat:xenial-8.0-7.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV JS_VERSION=6.2.0 \
    JS_HOME=/opt/jasperreports-server \
    JS_BUILD=/opt/jasperreports-server/buildomatic \
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

# Change Working User to "Root"
USER user
