Nginx 1.10.2 + PHP 5.6 + PHP Composer Image from Modified Base Image of CentOS (7.3). This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/centos-php-nginx:7.3-5.6-1.10.2

**How to run this image:**

> docker run -p 80:8080 -v <local_data_path>:/var/www --name centos-nginx dimaskiddo/centos-php-nginx:7.3-5.6-1.10.2

**How to get in container after run this image:**

> docker exec -it centos-nginx /bin/bash
