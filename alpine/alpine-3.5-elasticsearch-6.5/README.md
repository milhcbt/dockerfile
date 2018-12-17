ElasticSearch 6.5 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:elasticsearch-6.5

**How to run this image:**

> docker run -p 9200:9200 -p 9300:9300 --name elasticsearch dimaskiddo/alpine:elasticsearch-6.5

**How to get in container after run this image:**

> docker exec -it elastic /bin/bash
