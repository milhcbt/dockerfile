Microsoft SQL Server 2017 Image from Modified Base Image of Debian. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/debian:mssql-2017

**How to run this image:**

> docker run -p 1433:1433 -v <local_data_path>:/var/lib/mysql/data --name mssql dimaskiddo/debian:mssql-2017

**How to get in container after run this image:**

> docker exec -it mssql /bin/bash
