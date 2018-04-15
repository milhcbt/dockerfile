Swagger UI 3.7.0 with Nginx 1.13.5 Image from Modified Base Image of Ubuntu Xenial (16.04).

This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/ubuntu-nginx-swaggerui:xenial-1.13.5-3.7.0

**How to run this image:**

> docker run -p 80:8080 -p 443:8443 -v <local_data_path>:/var/www --name ubuntu-swaggerui dimaskiddo/ubuntu-nginx-swaggerui:xenial-1.13.5-3.7.0

**How to get in container after run this image:**

> docker exec -it ubuntu-nginx-swaggerui /bin/bash
