PHP 5.6 + Composer with Apache 2.4 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:php-5.6-apache

**How to run this image:**

> docker run -p 80:8080 -v <local_data_path>:/var/www/data --name php dimaskiddo/alpine:php-5.6-apache

**How to get in container after run this image:**

> docker exec -it php /bin/bash
