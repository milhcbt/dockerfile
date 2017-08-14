Tomcat 7.0 + JasperReports Server 6.0.1 from Base Image of Debian (9.1)
This image is ready to run using custom User ID with non-root user execution for OpenShift ready

Build with love from Gegerkalong, Bandung, Indonesia

Maintainer:
Dimas Restu H <dimas.restu@student.upi.edu>


How to pull this image:
docker pull dimaskiddo/debian-tomcat-jasper:9.1-7.0-6.0.1


How to run this image:
docker run -p 80:8080 -p 443:8443 -v <local_data_path>:/usr/local/tomcat/webapps -e JS_DB_TYPE=<db_type> -e JS_DB_HOST=<db_host_alias> -e JS_DB_PORT=<db_host_port> -e JS_DB_ROOT_USER=<db_root_user> -e JS_DB_ROOT_PASSWORD=<db_root_password> --link <db_host_name>:<db_host_alias> --name <container_name> dimaskiddo/debian-tomcat-jasper:9.1-7.0-6.0.1


How to get in container after run this image:
docker exec -it <container_name> /bin/bash
