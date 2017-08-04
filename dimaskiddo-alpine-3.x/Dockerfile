FROM alpine:3.5
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Layer 01
# Install Base Packages and Run Some Housekeeping
RUN apk update \
    && apk add \
        bash \
        ca-certificates \
        coreutils \
        curl \
        grep \
        gzip \
        nano \
        net-tools \
        rsync \
        tar \
        sed \
        vim \
        wget \
    && rm -rf /var/cache/apk/* \
    && chmod 770 /root \
    && touch /root/.bashrc \
    && chmod 664 /root/.bashrc \
    && chmod 664 /etc/passwd

# Change Working Directory to "Root" Home Directory
WORKDIR /root
