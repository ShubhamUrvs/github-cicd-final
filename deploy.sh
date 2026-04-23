#!/bin/bash
set -e

# Variables
IMAGE_NAME=$1
CONTAINER_NAME="webapp"
HOST_PORT=80
CONTAINER_PORT=3000

echo "Starting deployment for $IMAGE_NAME..."

# Pull the latest Docker image
echo "Pulling image..."
docker pull $IMAGE_NAME

# Check if a container with the same name is already running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping existing container..."
    docker stop $CONTAINER_NAME
    echo "Removing existing container..."
    docker rm $CONTAINER_NAME
fi

# Remove dangling images to free up space
docker image prune -f

# Run the new container
echo "Starting new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p $HOST_PORT:$CONTAINER_PORT \
  --restart always \
  $IMAGE_NAME

echo "Deployment completed successfully!"
