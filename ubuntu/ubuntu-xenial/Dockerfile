FROM ubuntu:xenial
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV LC_ALL C.UTF-8

# Change Working User to "Root"
USER root

# Change Working Directory to "Root" Home Directory
WORKDIR /root

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build
