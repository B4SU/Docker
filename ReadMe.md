## Docker Image

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


## Docker Compose
Tool for defining and running multi container docker applications.
- Download Link https://docs.docker.com/compose/install/
- Already installed in Mac & Windows along with docker apps


```sh
chmod +x /usr/local/bin/docker-compose #Apply executable permission to the binary
vi docker-compose.yml #Create docker-compose file

```

```docker-compose
version: '3'

services:
 mydb:
  image: mysql:5
  environment:
   MYSQL_ROOT_PASSWORD: psswd

 mywordpress:
  image: wordpress
  ports:
   - 9999:80
  links:
   - mydb:mysql

```

```docker-compose
docker-compose config #Check validity of the file

docker-compose up -d #Run docker-compose.yml file in detached mode (-d)

docker-compose down #Bring down the applications

```
