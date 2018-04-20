MongoDB 3.4 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:mongodb-3.4

**How to run this image:**

> docker run -p 27017:27017 -v <local_data_path>:/data --name mongodb dimaskiddo/alpine:mongodb-3.4

**How to get in container after run this image:**

> docker exec -it mongodb /bin/bash
