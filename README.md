# Docker Container Management Script

## Overview

This Bash script streamlines the management of Docker containers by providing functionalities for starting, stopping, and removing containers.

## Usage

### Prerequisites

- [Docker](https://www.docker.com/) installed on your system.

### Running the Script

1. Make the script executable:

    ```bash
    chmod +x docker_container_manager.sh
    ```

2. Run the script with the following parameters:

    ```bash
    ./docker_container_manager.sh CONTAINER_NAME DOCKER_IMAGE [HOST_PORT] [CONTAINER_PORT]
    ```

    - `CONTAINER_NAME`: Name for the Docker container.
    - `DOCKER_IMAGE`: Docker image to use.
    - `HOST_PORT` (Optional): Port on the host machine (default: 8080).
    - `CONTAINER_PORT` (Optional): Port within the Docker container (default: 80).

## Functionality

1. **Start Container:**

    The script checks if the specified Docker container is already running. If not, it starts the container with the provided parameters.

2. **Remove Container:**

    After starting the container, the script asks if you want to remove the container. If confirmed, it removes the container.

3. **Stop Container:**

    If you choose not to remove the container, the script asks if you want to stop the container. If confirmed, it stops the running container.

## Notes

- The script uses Docker commands, so ensure Docker is installed and accessible in your system environment.

- User interactions are prompted for confirmation, providing flexibility and control over container management.

- Feel free to customize the script according to your specific needs.
