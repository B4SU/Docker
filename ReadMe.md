



## Docker Image

### Image creation using dockerfile

```sh

docker commit UB1 myubuntu:V1       #  Create docker image from existing container 'UB1'

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

docker build -t mycentos:V1 .         # Build image using the dockerfile

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
#Docker compose sample file
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
docker-compose config     # Check validity of the file

docker-compose up -d      # Run docker-compose.yml file in detached mode (-d)

docker-compose down       # Bring down the applications

```

```docker-compose

# Docker compose file to setup LAMP environment

version: '3'

services:
 mydb:
  image: mysql
  environment:
   MYSQL_ROOT_PASSWORD: passwd

 apache:
  image: httpd
  ports:
   - 9090:80
  links:
   - mydb:mysql

 php:
  image: php:7.2-apache
  links:
   - mydb:mysql
   - apache:httpd


# Docker compose file to setup CI-CD environment

version: '3'

services:
 jenkinsserver:
  image: jenkins
  ports:
   - 5050:8080

 qaserver:
  image: tomcat
  ports:
   - 6060:8080
  links:
   - jenkinsserver:jenkins

 prodserver:
  image: tomcat
  ports:
   - 7070:8080
  links:
   - jenkinsserver:jenkins


```


## Docker Network


## Docker Swarm
Swarm is a group of machines are running docker and part of a cluster.
Docker Swarm is a tool for container orchestration.

Pre-requisites
1. Docker 1.13 or higher
2. Docker Machine download link
    https://docs.docker.com/machine/install-machine/#installing-machine-directly
    https://docs.docker.com/get-started/swarm-deploy/


    ![alt text][logo]

    [logo]: https://docs.docker.com/engine/swarm/images/services-diagram.png "Logo Title Text 2"


Create Docker machines (to act as nodes for Docker Swarm). Create one machine as manager and others as workers

```docker
    docker-machine create --driver virtualbox manager1    # Mac, for Windows replace virtualbox with hyperv

    docker-machine ls        # List machine



```  
