FROM dimaskiddo/debian:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV GOSU_VERSION=1.11 \
    MSSQL_SERVER_VERSION=2017 \
    PATH=$PATH:/opt/mssql/bin

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/opt/mssql

# Expose Ports
EXPOSE 1433

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["sh","-c","sqlservr $ARGS"]

# Change Working User to "MSSQL"
USER mssql

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="Virtual Machine (VM) like container platform with Microsoft SQL Server 2017" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian (8.x) with Microsoft SQL Server 2017" \
      io.k8s.display-name="Debian (8.x) with Microsoft SQL Server 2017" \
      io.openshift.tags="builder,debian,mssql" \
      io.openshift.expose-services="1433:mssql" \
      io.openshift.non-scalable="false"
