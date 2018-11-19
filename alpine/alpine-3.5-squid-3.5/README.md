Squid 3.5 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:squid-3.5

**How to run this image:**

> docker run -p 3128:3128 -v <local_data_path_cache>:/var/spool/squid -v <local_data_path_log>:/var/log/squid --name redis dimaskiddo/alpine:squid-3.5

**How to get in container after run this image:**

> docker exec -it squid /bin/bash
