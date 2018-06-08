FROM dimaskiddo/alpine:nodejs-8.9.3
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV ADMIN_MONGO_VERSION master

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Change Working Directory to Application Directory
WORKDIR /usr/src/app

# Expose Ports
EXPOSE 1234

# Set Executor Script
CMD ["npm","start"]

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Alpine" \
      summary="Virtual Machine (VM) like container platform with AdminMongo 1.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Alpine (3.x) with AdminMongo 1.0" \
      io.k8s.display-name="Alpine (3.x) with AdminMongo 1.0" \
      io.openshift.tags="builder,alpine,nodejs,adminmongo" \
      io.openshift.expose-services="1234:http" \
      io.openshift.non-scalable="false"
