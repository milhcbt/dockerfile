FROM debian:jessie
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Update Repository Configuration
COPY ./sources/sources.list /etc/apt/sources.list

# Layer 02
# Install Base Packages
RUN apt-get -y update \
    && apt-get -y install \
        apt-utils \
        nano \
        net-tools \
        vim \        
        wget \
    && apt-get -y autoremove \
    && apt-get -y clean
