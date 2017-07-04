FROM centos:7.3.1611
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Layer 01
# Update Packages Repository
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
        wget \
    && yum clean all
