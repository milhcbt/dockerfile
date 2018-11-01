Apache JMeter 5.0 Image from Modified Base Image of Alpine. This image is ready to run using custom User ID with non-root user execution for OpenShift ready.

Build with love from Gegerkalong, Bandung, Indonesia.

**Maintainer:**

Dimas Restu H (<dimas.restu@student.upi.edu>)

**How to pull this image:**

> docker pull dimaskiddo/alpine:jmeter-5.0

**How to run this image:**

> docker run -p 1099:1099 -p 32001:32001 -e JMETER_NODE_TYPE=master -e JMETER_REMOTE_HOSTS=127.0.0.1 --name jmeter-master dimaskiddo/alpine:jmeter-5.0

**How to get in container after run this image:**

> docker exec -it jmeter /bin/bash
