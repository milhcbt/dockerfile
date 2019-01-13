MariaDB 10.3 Image from Modified Base Image of Debian. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/debian:mariadb-10.3

**How to run this image:**

> docker run -p 3306:3306 -v <local_data_path>:/var/lib/mysql/data --name mariadb dimaskiddo/debian:mariadb-10.3

**How to get in container after run this image:**

> docker exec -it mariadb /bin/bash
