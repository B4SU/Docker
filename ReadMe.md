#Docker Image
### Image creation using dockerfile



```shell
#Create dockerfile

touch dockerfile
vim dockerfile

```

```dockerfile
# Contents of dockerfile

FROM centos
MAINTAINER B4SU
RUN yum update -y
RUN yum install git tree -y
VOLUME /CENTOS_DATA

```

```shell
# Build image
docker build -t mycentos:V1 .

```

```sh
# Create container using new image
docker run --name MC1 -itd mycentos:V1
```
