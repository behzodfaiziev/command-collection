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

### Check Docker Version
- `docker version`: Check Docker version

### Display Docker System Information
- `docker info`: Display Docker system information

### Pull Docker Image
- `docker pull image_name:tag`: Pull a Docker image

## Images

### List Docker Images
- `docker images`: List Docker images

### Build Docker Image from Dockerfile
- `docker build -t image_name:tag .`: Build a Docker image from a Dockerfile

### Remove Docker Image
- `docker rmi image_name:tag`: Remove a Docker image

## Containers

### Run Docker Container
- `docker run -it --name container_name image_name:tag`: Run a Docker container

### List Running Containers
- `docker ps`: List running Docker containers

### List All Containers (Including Exited Ones)
- `docker ps -a`: List all Docker containers (including exited ones)

### Stop Docker Container
- `docker stop container_name`: Stop a running Docker container

### Remove Docker Container
- `docker rm container_name`: Remove a Docker container

## Networks

### List Docker Networks
- `docker network ls`: List Docker networks

### Create Docker Network
- `docker network create network_name`: Create a Docker network

### Inspect Docker Network
- `docker network inspect network_name`: Inspect a Docker network

## Volumes

### List Docker Volumes
- `docker volume ls`: List Docker volumes

### Create Docker Volume
- `docker volume create volume_name`: Create a Docker volume

### Inspect Docker Volume
- `docker volume inspect volume_name`: Inspect a Docker volume

## Compose

### Docker Compose Up
- `docker-compose up -d`: Bring up Docker Compose services in detached mode

### Docker Compose Down
- `docker-compose down`: Stop and remove Docker Compose services

### Docker Compose Logs
- `docker-compose logs`: View logs from Docker Compose services
