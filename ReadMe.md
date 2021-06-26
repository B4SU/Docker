Docker Image
### Image creation using dockerfile

Create dockerfile

```shell

touch dockerfile
vim dockerfile

```

Contents

```dockerfile

FROM centos
MAINTAINER B4SU
RUN yum update -y
RUN yum install git tree -y
VOLUME /CENTOS_DATA

```

```shell

docker build -t mycentos:V1 .

```
