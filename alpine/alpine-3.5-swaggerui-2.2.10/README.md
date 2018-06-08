Swagger UI 2.2.10 with Nginx Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:swaggerui-2.2.10

**How to run this image:**

> docker run -p 80:8080 --name swaggerui dimaskiddo/alpine:swaggerui-2.2.10

**How to get in container after run this image:**

> docker exec -it swaggerui /bin/bash
