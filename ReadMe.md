



## Docker Image

#### Image creation from container

```sh

docker commit UB1 myubuntu:V1       #  Create docker image from existing container 'UB1'

```


#### Image creation using dockerfile

```sh
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

```sh

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

##### Command to manage networks
```sh
docker network
```


##### Child commands

|Command                   | Description                                             |
|--------------------------|---------------------------------------------------------|
|docker network connect    | Connect a container to a network                        |
|docker network create     | Create a network                                        |
|docker network disconnect | Disconnect a container from a network                   |
|docker network inspect    | Display detailed information on one or more networks    |
|docker network ls         | List networks                                           |
|docker network prune      | Remove all unused networks                              |
|docker network rm         | Remove one or more networks                             |


  Three types of network available in docker

|Bridge | Private internal network created by docker, by default containers are attached to this network. |
|Host   | Host network itself, doesn't off
|None   |

  Bridge is the default network where containers are attached. Containers can be attached to other network using this command.

  ```sh
  docker run ubuntu --network=none
  docker run ubuntu --network=host
  ```

Overlay Network
  It is an internal hybrid network which can be created for Docker swarm.
  ```
  docker network create --driver overlay --subnet 10.0.9.0/24 my-Overlay
  docker service create --replicas 2 --network my-Overlay nginx
  ```


## Docker Swarm

##### Overview
Swarm is a group of machines that are running docker and part of a cluster. Docker Swarm is a tool for container orchestration.

Pre-requisites
1. Docker 1.13 or higher
2. Docker Machine download link
    https://docs.docker.com/machine/install-machine/#installing-machine-directly
    https://docs.docker.com/get-started/swarm-deploy/


    ![alt text][logo]

    [logo]: https://docs.docker.com/engine/swarm/images/services-diagram.png "Docker"


##### Docker Machine
Docker Machine is a tool to install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands.

Ref: https://docs.docker.com/machine/


Create manager and worker node using virtualbox driver. For other available driver details refer https://docs.docker.com/machine/drivers/

```sh
docker-machine create --driver virtualbox manager
docker-machine create --driver virtualbox worker1
docker-machine create --driver virtualbox Worker2

docker-machine ls           # List machine

docker-machine IP manager   # Obtain IP Address of manager

docker-machine ssh manager  # Connect to docker machines via ssh
```

##### Swarm Initialization

```sh
#Manager Node
  docker swarm init --advertise-addr 192.168.99.100   # Command to initialize docker swarm in this case manager node ip address is 192.168.99.100

  docker swarm join-token manager     # Command to obtain token for adding additional manager node in the swarm
  docker swarm join-token worker      # Command to obtain token for adding worker node in the swarm
  docker node ls                      # List swarm nodes
  docker swarm leave                  # Remove node from the swarm

  #Other docker commands
  docker info
  docker swarm

```  

##### Run Service in Docker Swarm

```sh
#Manager node
  docker service create --replicas 3 -p 80:80 --name myweb nginx    # Creating nginx server named myweb with 3 replicas, accessible at port 80

  docker service update --image nginx:1.14.0 myweb      # Command to update existing service

  #List service and node information
  docker service ls
  docker service ps myweb

  #Scale service up and down
  docker service scale myweb=4

  #Inspect docker nodes
  docker node inspect <nodename>

  #Shutdown specific node
  docker node update --availability drain worker1

  #Remove service
  docker service rm myweb
```


##### Docker Swarm using dockerfile
