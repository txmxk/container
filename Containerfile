FROM registry.access.redhat.com/ubi8/ubi:8.0
MAINTAINER devopstantra

RUN yum install -y --disableplugin=subscription-manager httpd && \
RUN yum clean all --disableplugin=subscription-manager -y && \
RUN echo "Hello from the httpd-parent container!" > /var/www/html/index.html

EXPOSE 80

# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd

USER 1003

# Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
