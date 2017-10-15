FROM dimaskiddo/ubuntu:xenial
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV TZ=Asia/Jakarta \
    JAVA_HOME=/usr/lib/jvm/java-8-oracle \
    JAVA_VERSION=8u144

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build
