Apache Tomcat 8.5 with Oracle JRE 1.8 (8.0) Image from Modified Base Image of Ubuntu Xenial (16.04).

This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/ubuntu-oraclejre-tomcat:xenial-8.0-8.5

**How to run this image:**

> docker run -p 80:8080 -p 443:8443 -v <local_data_path>:/var/www --name ubuntu-apache dimaskiddo/ubuntu-oraclejre-tomcat:xenial-8.0-8.5

**How to get in container after run this image:**

> docker exec -it ubuntu-tomcat /bin/bash
