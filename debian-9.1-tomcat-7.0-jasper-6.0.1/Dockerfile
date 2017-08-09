FROM dimaskiddo/debian-tomcat:9.1-7.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Change Working Directory to "Root" Home Directory
WORKDIR /root

# Set Environment Variables
ENV JS_VERSION=6.0.1 \
    JS_HOME=/opt/jasperreports-server \
    JS_BUILD=/opt/jasperreports-server/buildomatic \
    JS_XMX=512m \
    JS_MAXPERMSIZE=256m \
    JS_CATALINA_OPTS="-XX:+UseBiasedLocking -XX:BiasedLockingStartupDelay=0 -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+DisableExplicitGC -XX:+CMSIncrementalMode -XX:+CMSIncrementalPacing -XX:+CMSParallelRemarkEnabled -XX:+UseCompressedOops -XX:+UseCMSInitiatingOccupancyOnly"

# Layer 01
# Copy JasperReports Server Installation and Container Scripts
COPY ./packages/jasperreports-server*.zip /tmp/jasperreports-server.zip

# Layer 02
# Install Base Packages and Run Some Housekeeping
RUN apt-get update \
    && apt-get -y install \
        nano \
        unzip \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && chmod 770 /root \
    && chmod 664 /root/.bashrc \
    && chmod 664 /etc/passwd

# Layer 03
# Install JasperReports Server
RUN mkdir -p $JS_HOME \
    && unzip /tmp/jasperreports-server.zip -d $JS_HOME \
    && mv -v $JS_HOME/jasperreports-server-cp-${JS_VERSION}-bin/* $JS_HOME \
    && rm -rf $JS_HOME/jasperreports-server-cp-${JS_VERSION}-bin \
    && rm -rf /tmp/* \
    && chown -R root:root $JS_HOME \
    && chown -R root:root $CATALINA_HOME \
    && chown -R root:root /usr/lib/jvm/java-7-openjdk-amd64 \
    && chmod -R ug+rw $JS_HOME \
    && chmod -R ug+rw $CATALINA_HOME \
    && chmod -R ug+rw /usr/lib/jvm/java-7-openjdk-amd64

# Layer 04
# Copy Container Scripts
COPY ./entry/container-entrypoint /usr/local/bin/container-entrypoint

# Layer 05
# Change Container Scripts Permissions
RUN chmod 755 /usr/local/bin/container-entrypoint

# Set Volumes Directory
VOLUME $CATALINA_HOME/webapps

# Expose Ports
EXPOSE 8080 8443

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/bin/container-entrypoint"]

# Set Executor Script
CMD ["run"]

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="JasperReports Server 6 with Tomcat 7" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="JasperReports Server 6 + Tomcat 7" \
      io.k8s.display-name="JasperReports Server 6 + Tomcat 7" \
      io.openshift.tags="builder,jasperreports6,tomcat7" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
