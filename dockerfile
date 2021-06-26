FROM centos
MAINTAINER B4SU
RUN yum update -y
RUN yum install git tree -y
VOLUME /CENTOS_DATA
