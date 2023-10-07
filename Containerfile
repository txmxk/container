# Use this file to create parent image
#----------------------------------------
FROM registry.access.redhat.com/ubi8/ubi:8.0
MAINTAINER devps
ENV DOCROOT=/var/www/html
RUN yum install -y --disableplugin=subscription-manager httpd && \
    yum clean all --disableplugin=subscription-manager -y && \
    echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html

ONBUILD COPY src/ ${DOCROOT}/
EXPOSE 80
RUN rm -rf /run/httpd && mkdir /run/httpd
USER root
CMD /usr/sbin/httpd -DFOREGROUND
