FROM centos:centos6
MAINTAINER Yoshi Sakai <info@bluemooninc.jp>

ENV CB_VERSION		3.0.3
ENV CB_RELEASE_URL	http://packages.couchbase.com/releases
ENV CB_PACKAGE		couchbase-server-enterprise-3.0.3-centos6.x86_64.rpm

# Install yum dependencies
# RUN yum install -y hostname
RUN yum install -y initscripts
RUN yum install -y openssl
RUN yum install -y pkgconfig
RUN yum install -y sudo
RUN yum install -y tar
RUN yum install -y wget

RUN wget $CB_RELEASE_URL/$CB_VERSION/$CB_PACKAGE
RUN yum install -y $CB_PACKAGE
## for download locale
#ADD $CB_PACKAGE /tmp/$CB_PACKAGE
#RUN yum install -y /tmp/$CB_PACKAGE
#RUN rm -f /tmp/$CB_PACKAGE

EXPOSE 8091 8092 11210

# Add start script
CMD /opt/couchbase/bin/couchbase-server start -- -noinput
