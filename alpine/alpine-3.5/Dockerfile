FROM alpine:3.5
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV LC_ALL=C.UTF-8 \
    GLIBC_VERSION=2.26-r0

# Change Working User to "Root"
USER root

# Change Working Directory to "Root" Home Directory
WORKDIR /root

# Copy Builder Files
COPY ./content/ /usr/local/docker/

# Install Builder Prequisites
RUN set -ex \
    && mv /etc/apk/repositories /etc/apk/repositories.backup \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.4/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add tzdata ca-certificates bash wget \
    && rm -rf /var/cache/apk/*

# Run Builder Scripts
RUN chmod 775 /usr/local/docker/bin/build \
    && /usr/local/docker/bin/build \
    && rm -f /usr/local/docker/bin/build
