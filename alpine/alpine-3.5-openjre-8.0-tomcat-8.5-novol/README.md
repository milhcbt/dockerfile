Apache Tomcat 8.5 + OpenJRE 8.0 Image from Modified Base Image of Alpine (3.5). This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine-openjre-tomcat:3.5-8.0-8.5

**How to run this image:**

> docker run -p 80:8080 -v <local_data_path>:/opt/tomcat/webapps --name alpine-tomcat dimaskiddo/alpine-openjre-tomcat:3.5-8.0-8.5

**How to get in container after run this image:**

> docker exec -it alpine-tomcat /bin/bash
