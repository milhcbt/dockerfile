FROM dimaskiddo/debian-openjdk-tomcat:8.9-8.0-7.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

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
# Install JasperReports Server
RUN mkdir -p $JS_HOME \
    && unzip /tmp/jasperreports-server.zip -d $JS_HOME \
    && mv -v $JS_HOME/jasperreports-server-cp-${JS_VERSION}-bin/* $JS_HOME \
    && rm -rf $JS_HOME/jasperreports-server-cp-${JS_VERSION}-bin \
    && rm -rf /tmp/* \
    && chown -R root:root $JS_HOME \
    && chown -R root:root $CATALINA_HOME \
    && chmod -R 775 $JS_HOME \
    && chmod -R 775 $CATALINA_HOME

# Layer 03
# Copy Container Scripts
COPY ./entry/container-entrypoint /usr/local/bin/container-entrypoint

# Layer 04
# Change Container Scripts Permissions
RUN chmod 755 /usr/local/bin/container-entrypoint

# Set Volumes Directory
VOLUME $CATALINA_HOME/webapps

# Expose Ports
EXPOSE 8080

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/bin/container-entrypoint"]

# Set Executor Script
CMD ["run"]

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="Virtual Machine (VM) like container platform for running JasperReports Server 6.0.1 applications with Tomcat 7.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian Jessie (8.x) JasperReports Server 6.0.1 with Tomcat 7.0" \
      io.k8s.display-name="Debian Jessie (8.x) JasperReports Server 6.0.1 with Tomcat 7.0" \
      io.openshift.tags="builder,debian8,openjdk8,tomcat7,jasperreports6" \
      io.openshift.expose-services="8080:http,8443:https" \
      io.openshift.non-scalable="false"
