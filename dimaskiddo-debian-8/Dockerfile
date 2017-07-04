FROM debian:jessie
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Backup Current Repository File
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Layer 02
# Update Repository to Indonesia Local Repository
COPY ./repo/sources.list /etc/apt/sources.list

# Layer 03
# Update Packages Repository
RUN apt-get -y update \
    && apt-get -y install \
        apt-utils \
        nano \
        net-tools \
        wget \
    && apt-get -y autoremove \
    && apt-get -y clean
