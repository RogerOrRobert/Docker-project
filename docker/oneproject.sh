#!/bin/bash

# Container name
CONTAINER_NAME=$1

# Docker image to use
DOCKER_IMAGE=$2

# Host port
if [[ ! -z "$3" ]]; then
    HOST_PORT=$3
else
    # Default host port if no argument is provided
    HOST_PORT=8080
fi

# Container port
if [[ ! -z "$4" ]]; then
    CONTAINER_PORT=$4
else
    # Default container port if no argument is provided
    CONTAINER_PORT=80
fi

# Command to start the container
START_COMMAND="docker run -d -p $HOST_PORT:$CONTAINER_PORT --name $CONTAINER_NAME $DOCKER_IMAGE"
eval $START_COMMAND

# Check if the container is already running
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
    echo "Container $CONTAINER_NAME is already running."
else
    # Start the container
    echo "Starting container $CONTAINER_NAME..."
    eval $START_COMMAND
    echo "Container $CONTAINER_NAME started on port $HOST_PORT."
fi

CONTAINER_ID=$(docker ps -l -aqf "name=$CONTAINER_NAME")

# Ask the user if they want to remove the container
echo "Do you want to remove the container $CONTAINER_NAME? (y/n)"
read response
if [ "$response" == "y" ]; then
    docker rm "$CONTAINER_ID"
    echo "Container $CONTAINER_NAME removed."
else
    echo "Container was not removed."
    echo "Do you want to stop the container $CONTAINER_NAME? (y/n)"
    read response
    if [ "$response" == "y" ]; then
        STOP_COMMAND="docker stop $CONTAINER_NAME"
        eval $STOP_COMMAND

        # Check if the container is already stopped
        if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
            # Stop the container
            echo "Stopping container $CONTAINER_NAME..."
            eval $STOP_COMMAND
            echo "Container $CONTAINER_NAME stopped."
        else
            echo "Container $CONTAINER_NAME is already stopped."
        fi
    fi
fi
