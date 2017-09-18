Apache 2.4 + PHP 7.0 + PHP Composer Image from Modified Base Image of Alpine (3.5). This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine-php-apache:3.5-7.0-2.4

**How to run this image:**

> docker run -p 80:8080 -v <local_data_path>:/var/www/data --name alpine-apache dimaskiddo/alpine-php-apache:3.5-7.0-2.4

**How to get in container after run this image:**

> docker exec -it alpine-apache /bin/bash
