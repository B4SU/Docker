# Docker Image

### Image creation using dockerfile

```sh

docker commit UB1 myubuntu:V1  #  Create docker image from existing container 'UB1'

```


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

docker build -t mycentos:V1 .   # Build image using the dockerfile

```

```sh
docker run --name MC1 -itd mycentos:V1    # Create container using newly created image - mycentos:V1
```
