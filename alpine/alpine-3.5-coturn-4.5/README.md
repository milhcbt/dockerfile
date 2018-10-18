CoTURN 4.5 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:coturn-4.5

**How to run this image:**

> docker run -p 3478:3478 -p 3478:3478/udp --name turn dimaskiddo/alpine:coturn-4.5

**How to get in container after run this image:**

> docker exec -it turn /bin/bash
