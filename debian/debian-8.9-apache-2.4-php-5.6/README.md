Apache 2.4 + PHP 5.6 + PHP Composer Image from Modified Base Image of Debian (8.9). This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/debian-php-apache:8.9-5.6-2.4

**How to run this image:**

> docker run -p 80:8080 -v <local_data_path>:/var/www --name debian-apache dimaskiddo/debian-php-apache:8.9-5.6-2.4

**How to get in container after run this image:**

> docker exec -it debian-apache /bin/bash
