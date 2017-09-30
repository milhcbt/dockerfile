Nginx 1.10.3 + PHP 7.0 + PHP Composer Image from Modified Base Image of Alpine (3.5). This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

**This image has no volumes, use it for development only**

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine-php-nginx:3.5-7.0-1.10.3-novol

**How to run this image:**

> docker run -p 80:8080 -v <local_data_path>:/var/www/data --name alpine-nginx dimaskiddo/alpine-php-nginx:3.5-7.0-1.10.3-novol

**How to get in container after run this image:**

> docker exec -it alpine-nginx /bin/bash
