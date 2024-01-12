# Docker Commands

Welcome to the Docker Commands section! This document provides a quick reference for various Docker commands.

## Table of Contents
- [Basics](#basics)
- [Images](#images)
- [Containers](#containers)
- [Networks](#networks)
- [Volumes](#volumes)
- [Compose](#compose)

## Basics

- `docker version`: Check Docker version

- `docker info`: Display Docker system information

- `docker pull image_name:tag`: Pull a Docker image

## Images

- `docker images`: List Docker images

- `docker build -t image_name:tag .`: Build a Docker image from a Dockerfile

- `docker rmi image_name:tag`: Remove a Docker image

## Containers

- `docker run -it --name container_name image_name:tag`: Run a Docker container

- `docker ps`: List running Docker containers

- `docker ps -a`: List all Docker containers (including exited ones)

- `docker stop container_name`: Stop a running Docker container

- `docker rm container_name`: Remove a Docker container

## Networks

- `docker network ls`: List Docker networks

- `docker network create network_name`: Create a Docker network

- `docker network inspect network_name`: Inspect a Docker network

## Volumes

- `docker volume ls`: List Docker volumes

- `docker volume create volume_name`: Create a Docker volume

- `docker volume inspect volume_name`: Inspect a Docker volume

## Compose

- `docker-compose up -d`: Bring up Docker Compose services in detached mode

- `docker-compose down`: Stop and remove Docker Compose services

- `docker-compose logs`: View logs from Docker Compose services
