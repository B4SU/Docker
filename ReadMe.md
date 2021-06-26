Docker Image
### Image creation using dockerfile

Create dockerfile

'''Shell

touch dockerfile
vim dockerfile

'''

Contents
'''

FROM centos
MAINTAINER B4SU
RUN yum update -y
RUN yum install git tree -y
VOLUME /CENTOS_DATA

'''

'''Shell
docker build -t mycentos:V1 .
'''
