FROM dimaskiddo/ubuntu:base
MAINTAINER Dimas Restu Hidayanto <dimas.restu@student.upi.edu>

# Setting-up Environment
ENV ODOO_VERSION=10.0 \
    ODOO_RELEASE=20180808

# Copying Prequisites Configuration
COPY ./content/ /usr/local/docker/

# Setting-up Permissions
RUN chmod 775 /usr/local/docker/bin/build \
  && /usr/local/docker/bin/build \
  && rm -f /usr/local/docker/bin/build

# Set Volumes Directory
VOLUME ["/var/lib/odoo", "/mnt/odoo/addons"]

# Expose Ports
EXPOSE 8069 8071 8072

# Set Entrypoint Script
ENTRYPOINT ["/usr/local/docker/bin/entrypoint"]

# Set Executor Script
CMD ["sh","-c","odoo $ARGS"]

# Change Working User to "User"
USER user

# Set Labels Used in OpenShift to Describe the Builder Images
LABEL release=1 \
      vendor="Ubuntu" \
      summary="Virtual Machine (VM) like container platform with Odoo 10.0" \
      maintainer="Dimas Restu Hidayanto <dimas.restu@student.upi.edu>" \
      io.k8s.description="Ubuntu Xenial (16.04) with Odoo 10.0" \
      io.k8s.display-name="Ubuntu Xenial (16.04) with Odoo 10.0" \
      io.openshift.tags="builder,ubuntu,odoo" \
      io.openshift.expose-services="8069:odoo;8071:odoo-xmlrpc;8072:odoo-longpooling" \
      io.openshift.non-scalable="false"
