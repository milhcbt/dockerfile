FROM dimaskiddo/alpine-openjre:3.5-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV TOMCAT_MAJOR=7 \
    TOMCAT_VERSION=7.0.81 \
    CATALINA_HOME=/opt/tomcat

# Layer 01
# Installing Tomcat
RUN mkdir -p $CATALINA_HOME \
    && chown -R root:root $CATALINA_HOME \
    && chmod -R 664 $CATALINA_HOME \
    && cd $CATALINA_HOME \
    && wget -O tomcat.tar.gz http://www-us.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
    && tar xvfz tomcat.tar.gz --strip-components=1 \
    && rm -f tomcat.tar.gz* \
    && mkdir -p $CATALINA_HOME/webapps-docker \
    && cp -R $CATALINA_HOME/webapps/* $CATALINA_HOME/webapps-docker/ \
    && chown -R root:root $CATALINA_HOME \
    && chmod -R 775 $CATALINA_HOME

# Layer 02
# Copy Container Scripts
COPY ./entry/container-entrypoint /usr/local/bin/container-entrypoint

# Layer 03
# Change Container Scripts Permissions
RUN chmod 755 /usr/local/bin/container-entrypoint

# Set Environment Variables
ENV PATH $PATH:$CATALINA_HOME/bin

# Expose Ports
EXPOSE 8080

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/bin/container-entrypoint"]

# Set Executor Script
CMD ["run"]

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform for running Java web applications with Tomcat 7.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 7.0" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with Apache Tomcat 7.0" \
      io.openshift.tags="builder,alpine3,openjre8,tomcat70" \
      io.openshift.expose-services="8080:http" \
      io.openshift.non-scalable="false"
