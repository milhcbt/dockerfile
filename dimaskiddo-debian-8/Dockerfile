FROM debian:jessie
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Update Repository Configuration
COPY ./sources/sources.list /etc/apt/sources.list

# Layer 02
# Install Base Packages
RUN apt-get -y update \
    && apt-get -y install \
        sudo \
        apt-utils \
        nano \
        vim \
        net-tools \
        wget \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 03
# Update Sudoers Configuration
COPY ./config/sudoers /etc/sudoers

# Layer 05
# Creating Non-Root User as "User" and Give Sudo Privileges
RUN chmod 640 /etc/sudoers \
    && groupadd -r user -g 901 \
    && useradd -u 901 -m -d /home/user -s /bin/bash -c "User" -r -g 901 user \
    && chmod 755 /home/user

# Layer 06
# Change Working Directory to "User" Home Directory
WORKDIR /home/user

# Layer 07
# Change Working User to "User"
USER user
