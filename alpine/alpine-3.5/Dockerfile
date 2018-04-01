FROM alpine:3.5
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV LANG=C.UTF-8\
    LC_ALL=C.UTF-8 \
    GLIBC_VERSION=2.27-r0 \
    TZ=Asia/Jakarta

# Change Working User to "Root"
USER root

# Change Working Directory to "Root" Home Directory
WORKDIR /root

# Copy Builder Files
COPY ./content/ /usr/local/docker/

# Install Builder Prequisites
RUN set -ex \
    && apk update \
    && apk upgrade \
    && apk add tzdata ca-certificates bash wget \
    && rm -rf /var/cache/apk/*

# Run Builder Scripts
RUN chmod 775 /usr/local/docker/bin/build \
    && /usr/local/docker/bin/build \
    && rm -f /usr/local/docker/bin/build
