FROM dimaskiddo/alpine:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV ES_VERSION=6.5.2 \
    ES_GPG_KEY=46095ACC8548582C1A2699A9D27D666CD88E42B4 \
    ES_HOME=/opt/elasticsearch \
    ES_TMPDIR=/opt/elasticsearch/tmp \
    PATH=$PATH:/opt/elasticsearch/bin

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME /opt/elasticsearch/data

# Expose Ports
EXPOSE 9200 9300

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["elasticsearch"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with ElasticSearch 6.5" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with ElasticSearch 6.5" \
      io.k8s.display-name="Alpine (3.x) with ElasticSearch 6.5" \
      io.openshift.tags="builder,alpine,elasticsearch" \
      io.openshift.expose-services="9200:es-rest,9300:es-intercom" \
      io.openshift.non-scalable="false"
