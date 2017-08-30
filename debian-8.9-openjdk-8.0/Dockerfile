FROM dimaskiddo/debian:8.9
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV LANG=C.UTF-8 \
    JAVA_HOME=/java-home \
    JAVA_VERSION=8u141 \
    JAVA_DEBIAN_VERSION=8u131-b11-1~bpo8+1 \
    CA_CERTIFICATES_JAVA_VERSION=20161107~bpo8+1

# Layer 01
# Run Some Housekeeping
RUN echo "" >> /etc/apt/sources.list \
    && echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list \
    && apt-get -y update \
    && apt-get -y install \
        bzip2 \
        unzip \
        xz-utils \
    && apt-get -y autoremove \
    && apt-get -y clean

# Layer 02
# Setting-up JAVA_HOME Directory
RUN { \
      echo '#!/bin/bash'; \
      echo 'set -e'; \
      echo; \
      echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
    } > /usr/local/bin/java-home \
    && chmod +x /usr/local/bin/java-home \
    && ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /java-home

# Layer 03
# Installing OpenJDK
RUN mkdir -p /usr/share/man/man1 \
    && apt-get -y update \
    && apt-get -y install -t jessie-backports \
        ca-certificates-java="$CA_CERTIFICATES_JAVA_VERSION" \
        openjdk-8-jdk="$JAVA_DEBIAN_VERSION" \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && [ "$(readlink -f "$JAVA_HOME")" = "$(java-home)" ] \
    && update-alternatives --get-selections | awk -v home="$(readlink -f "$JAVA_HOME")" 'index($3, home) == 1 { $2 = "manual"; print | "update-alternatives --set-selections" }' \
    && update-alternatives --query java | grep -q 'Status: manual' \
    && /var/lib/dpkg/info/ca-certificates-java.postinst configure
