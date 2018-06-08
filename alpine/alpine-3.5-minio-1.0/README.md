Minio 1.0 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:minio-1.0

**How to run this image:**

> docker run -p 80:9000 -v <local_data_path>:/data/minio --name minio dimaskiddo/alpine:minio-1.0

**How to get in container after run this image:**

> docker exec -it minio /bin/bash
