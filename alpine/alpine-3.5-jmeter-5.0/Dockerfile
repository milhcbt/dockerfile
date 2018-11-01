FROM dimaskiddo/alpine:openjre-8.0
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Set Environment Variables
ENV JMETER_VERSION=5.0 \
    JMETER_NODE_TYPE=master \
    JMETER_REMOTE_HOSTS=127.0.0.1 \
    JMETER_HOME=/opt/jmeter \    
    HEAP="-Xms512m -Xmx1g -XX:MaxMetaspaceSize=256m" \
    PATH=$PATH:/opt/jmeter/bin

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Expose Ports
EXPOSE 1099 32001

# Change Working Directory to "JMeter" Binary Directory
WORKDIR /opt/jmeter/bin

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["sh","-c","/usr/local/docker/bin/command"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with JMeter 5.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) OpenJRE 8.0 with Apache JMeter 5.0" \
      io.k8s.display-name="Alpine (3.x) OpenJRE 8.0 with Apache JMeter 5.0" \
      io.openshift.tags="builder,alpine,openjre,jmeter" \
      io.openshift.expose-services="1099:jmeter,32001:jmeter-slave" \
      io.openshift.non-scalable="false"
