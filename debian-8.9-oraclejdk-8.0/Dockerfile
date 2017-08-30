FROM dimaskiddo/debian:8.9
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Layer 01
# Run Some Housekeeping
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" >> /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
    && apt-get -y update \
    && apt-get -y install \
        bzip2 \
        unzip \
        xz-utils \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 02
# Installing Docker Java Home Script
RUN { \
      echo '#!/bin/bash'; \
      echo 'set -e'; \
      echo; \
      echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/docker-java-home \
    && chmod +x /usr/local/bin/docker-java-home

# Layer 03
# Installing Oracle JDK
RUN apt-get -y update \
    && apt-get -y install \
        oracle-java8-installer \
        oracle-java8-set-default \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && update-alternatives --get-selections | awk -v home="$(readlink -f "$JAVA_HOME")" 'index($3, home) == 1 { $2 = "manual"; print | "update-alternatives --set-selections" }' \
    && update-alternatives --query java | grep -q 'Status: manual'
