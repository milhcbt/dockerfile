FROM dimaskiddo/alpine:openjre-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV SCALA_VERSION=2.12 \
    KAFKA_VERSION=2.1.0 \
    KAFKA_HOME=/opt/kafka \
    PATH=$PATH:/opt/kafka/bin

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /kafka

# Expose Ports
EXPOSE 9092 2181

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["kafka-server-start.sh", "/opt/kafka/config/server.properties"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with Kafka 2.1" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with Apache Kafka 2.1" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with Apache Kafka 2.1" \
      io.openshift.tags="builder,alpine,openjre,kafka" \
      io.openshift.expose-services="9092:kafka,2181:zookeper" \
      io.openshift.non-scalable="false"
