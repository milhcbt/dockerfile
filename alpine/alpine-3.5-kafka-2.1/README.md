Apache Kafka 2.1 + OpenJRE 8.0 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:kafka-2.1

**How to run this image:**

> docker run -p 9092:9092 -p 2181:2181 -v <local_data_path>:/data --name kafka dimaskiddo/alpine:kafka-2.1

**How to get in container after run this image:**

> docker exec -it kafka /bin/bash
