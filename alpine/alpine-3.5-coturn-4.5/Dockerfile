FROM dimaskiddo/alpine:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Expose Ports
EXPOSE 3478/tcp 3478/udp 5349/tcp 5349/udp

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["sh","-c","turnserver $ARGS"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with CoTURN 4.5" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with CoTURN 4.5" \
      io.k8s.display-name="Alpine (3.x) with CoTURN 4.5" \
      io.openshift.tags="builder,alpine,coturn" \
      io.openshift.expose-services="3478:coturn;5349:coturn-tls" \
      io.openshift.non-scalable="false"
