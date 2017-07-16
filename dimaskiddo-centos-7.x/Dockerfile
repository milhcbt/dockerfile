FROM centos:7.3.1611
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Layer 01
# Install Base Packages and Run Some Housekeeping
RUN rpm --rebuilddb \
    && rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 \
    && rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 \
    && yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
        epel-release \
        centos-release-scl \
    && yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
        yum-plugin-versionlock \
    && yum versionlock add \
        kernel \
        kernel-headers \
        kernel-devel \
        linux-firmwares \
    && yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
        nano \
        net-tools \
        iproute \
        rsync \
        vim \
        wget \
    && yum clean all

# Change Working Directory to "Root" Home Directory
WORKDIR /root
