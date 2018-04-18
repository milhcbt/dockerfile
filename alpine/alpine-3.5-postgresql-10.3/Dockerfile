FROM dimaskiddo/alpine:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV POSTGRESQL_VERSION 10.3

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
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with PostgreSQL 10.3" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with PostgreSQL 10.3" \
      io.k8s.display-name="Alpine (3.x) with PostgreSQL 10.3" \
      io.openshift.tags="builder,alpine,postgresql" \
      io.openshift.expose-services="5432:postgresql" \
      io.openshift.non-scalable="false"
