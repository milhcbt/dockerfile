FROM dimaskiddo/alpine:3.5
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV LANG=C.UTF-8 \
    JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre \
    PATH=$PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

# Layer 01
# Run Some Housekeeping
RUN cp /etc/apk/repositories /etc/apk/repositories.backup \
    && rm -f /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/main' >> /etc/apk/repositories \
    && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.6/community' >> /etc/apk/repositories \
    && chmod 644 /etc/apk/repositories

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
# Installing OpenJRE 8.0
RUN set -x \
    && apk update \
    && apk add \
        openjdk8-jre \
    && rm -rf /var/cache/apk/* \
    && [ "$JAVA_HOME" = "$(docker-java-home)" ]
