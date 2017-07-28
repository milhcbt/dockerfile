FROM centos:7.3.1611
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Change Working User to "Root"
USER root

# Layer 01
# Install Base Packages and Run Some Housekeeping
RUN rpm --rebuilddb \
    && rpm --import http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-7 \
    && rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 \
    && rpm --import https://raw.githubusercontent.com/sclorg/centos-release-scl/master/centos-release-scl/RPM-GPG-KEY-CentOS-SIG-SCLo \
    && rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi \
    && yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
        epel-release \
        centos-release-scl \
        http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
        yum-plugin-versionlock \
    && yum versionlock add \
        kernel \
        kernel-headers \
        kernel-devel \
        linux-firmwares \
    && yum -y --disableplugin=fastestmirror --setopt=tsflags=nodocs install \
        ca-certificates \
        curl \
        nano \
        net-tools \
        iproute \
        rsync \
        vim \
        wget \
        yum-utils \
    && yum clean all \
    && chmod 770 /root \
    && chmod 664 /root/.bashrc \
    && chmod 664 /etc/passwd

# Layer 02
# Update Repository Configuration
COPY ./yum.repos.d/remi.repo /etc/yum.repos.d/remi.repo

# Change Working Directory to "Root" Home Directory
WORKDIR /root
