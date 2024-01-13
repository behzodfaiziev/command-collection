# Table of Contents
- [Basics](#basics)
- [Images](#images)
- [Containers](#containers)
- [Networks](#networks)
- [Volumes](#volumes)
- [Compose](#compose)

## Basics

- `docker version`: Check Docker version

- `docker info`: Display Docker system information

- `sudo service docker restart`: Restart Docker

- `docker pull image_name:tag`: Pull a Docker image


## Images

- `docker images`: List Docker images

- `docker build -t <docker_id>/<repo_name>:<version> .`: Build a Docker image from a Dockerfile using a custom tag. Example: `docker build -t bbillionaire/myapp:1.0 .`

- `docker rmi image_name:tag`: Remove a Docker image

## Containers

- `docker run <image_name>`: Run a Docker container

- `docker run -p 3232:8080 <image_name>`: Run a Docker container and map port 3232 on the host to port 8080 in the container

- `docker create <image_name>`: Create a Docker container

- `docker start <container_id>`: Start a Docker container

- `docker ps`: List running Docker containers

- `docker ps -a`: List all Docker containers (including exited ones)

- `docker stop <container_id>`: Stop a running Docker container

- `docker kill <container_id>`: Kill a running Docker container (needed  when docker is not repsponding to stop)

- `docker rm <container_id>`: Remove a Docker container

- `docker system prune`: Remove all stopped containers, dangling images, and unused networks and volumes (use with caution)

- `docker logs <container_id>`: View logs from a Docker container

- `docker logs -f <container_id>`: Follow logs from a Docker container (Real-time)

- `docker exec -it <container_id> <command>`: Execute an additional command in a container

- `docker exec -it <container_id> sh`: Open a shell in a container (CTRL+D to exit). Note: `sh` may be replaced with `bash`, `powershell` or `zsh`.

- `docker run -it <image_name> sh`: Run a container and open a shell in it

## Build and Deploy
- `docker build .`: Build a Docker image from a Dockerfile in the current directory


## Compose

- `docker-compose up`: Bring up Docker Compose services

- `docker-compose up -d`: Bring up Docker Compose services in detached mode

- `docker-compose up --build`: Build and bring up Docker Compose services

- `docker-compose down`: Stop and remove Docker Compose services

- `docker-compose logs`: View logs from Docker Compose services

- `docker-compose logs -f`: Follow logs from Docker Compose services (Real-time)

## Networks

- `docker network ls`: List Docker networks

- `docker network create network_name`: Create a Docker network

- `docker network inspect network_name`: Inspect a Docker network

## Volumes

- `docker volume ls`: List Docker volumes

- `docker volume create volume_name`: Create a Docker volume

- `docker volume inspect volume_name`: Inspect a Docker volume
