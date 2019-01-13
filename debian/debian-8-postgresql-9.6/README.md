PostgreSQL 9.6 Image from Modified Base Image of Debian. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/debian:postgresql-9.6

**How to run this image:**

> docker run -p 5432:5432 -v <local_data_path>:/var/lib/pgsql/data --name postgresql dimaskiddo/debian:postgresql-9.6

**How to get in container after run this image:**

> docker exec -it postgresql /bin/bash
