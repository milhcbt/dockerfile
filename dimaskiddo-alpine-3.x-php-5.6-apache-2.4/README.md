Apache 2.4 + PHP 5.6 + PHP Composer Image from Modified Base Image of Alpine (3.x)
This image is ready to run using custom User ID with non-root user execution for OpenShift ready

Build with love from Gegerkalong, Bandung, Indonesia

Maintainer:
Dimas Restu H <dimas.restu@student.upi.edu>


How to pull this image:
docker pull dimaskiddo/alpine-php-apache:3.x-5.6-2.4


How to run this image with OpenShift execution style:
docker run -p 80:8080 --user <CUSTOM_USER_ID> --name <CONTAINER_NAME> dimaskiddo/alpine-php-apache:3.x-5.6-2.4


How to get interactive terminal in running container:
docker exec -it <CONTAINER_NAME> /bin/bash
