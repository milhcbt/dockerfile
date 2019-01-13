FROM dimaskiddo/debian:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV GOSU_VERSION=1.11 \
    POSTGRESQL_VERSION=9.6

ENV PATH $PATH:/usr/lib/postgresql/${POSTGRESQL_VERSION}/bin

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/lib/pgsql/data

# Expose Ports
EXPOSE 5432

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["sh","-c","postgres $ARGS"]

# Change Working User to "Postgres"
USER postgres

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Debian" \
      summary="Virtual Machine (VM) like container platform with PostgreSQL 9.6" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Debian (8.x) with PostgreSQL 9.6" \
      io.k8s.display-name="Debian (8.x) with PostgreSQL 9.6" \
      io.openshift.tags="builder,debian,postgresql" \
      io.openshift.expose-services="5432:postgresql" \
      io.openshift.non-scalable="false"
