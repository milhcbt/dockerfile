FROM debian:jessie
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Layer 01
# Update Repository Configuration
COPY ./sources/sources.list /etc/apt/sources.list

# Layer 02
# Install Base Packages and Run Some Housekeeping
RUN apt-get -y -o Acquire::Check-Valid-Until=false update \
    && apt-get -y -o Acquire::Check-Valid-Until=false install \
        apt-utils \
        ca-certificates \
        curl \
        htop \
        nano \
        net-tools \
        rsync \
        software-properties-common \
        vim \
        wget \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && chmod 770 /root \
    && chmod 664 /root/.bashrc \
    && chmod 664 /root/.profile \
    && chmod 664 /etc/passwd

# Change Working Directory to "Root" Home Directory
WORKDIR /root
