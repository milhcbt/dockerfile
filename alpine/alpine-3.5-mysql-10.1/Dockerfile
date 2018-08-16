FROM dimaskiddo/alpine:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /var/lib/mysql/data

# Expose Ports
EXPOSE 3306

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["sh","-c","mysqld --innodb-flush-method=fsync --console $ARGS"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with MySQL/MariDB 10.1" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with MySQL/MariDB 10.1" \
      io.k8s.display-name="Alpine (3.x) with MySQL/MariDB 10.1" \
      io.openshift.tags="builder,alpine,mysql" \
      io.openshift.expose-services="3306:mysql" \
      io.openshift.non-scalable="false"
