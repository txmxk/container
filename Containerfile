# Base Image
FROM registry.access.redhat.com/ubi8/ubi:8.0
MAINTAINER Manoj KC

# Document for apache
# Environment Variables for this container image
ENV DOCROOT=/var/www/html

RUN yum install -y --nodocs --disableplugin=subscription-manager httpd
RUN yum clean all --disableplugin=subscription-manager -y && \
    echo "Hello from httpd-parent container " > ${DOCROOT}/index.html

EXPOSE 80

# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd

#Run as the root user
USER root  #Runs apache server process as root

#Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
