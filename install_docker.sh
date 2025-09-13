#!bin/bash
# Script to install Docker and Docker Compose on a Linux system
# Run this script with superuser privileges
# Example: sudo ./install_docker.sh
# Update package list
    sudo apt-get update -y

    # Install prerequisites
    echo "[1] ###- Installing prerequisites ###"
    sudo apt-get install -y \ 
        apt-transport-https \ 
        ca-certificates \ 
        curl \ 
        software-properties-common

    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Set up the stable Docker repository
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update package list and install Docker
    echo "[2] ###- Installing Docker ###"
    sudo apt-get update -y
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Add the current user to the Docker group
    echo "[3] ###- Adding user to Docker group ###"
    sudo usermod -aG docker $USER

    # Install Docker Compose (latest version)
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
        sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
     # enable Docker to start on boot
        sudo systemctl enable docker
        # Start Docker service
        sudo systemctl start docker
        # Print Docker and Docker Compose versions to verify installation
                sleep 3
        clear
        echo "---------------------------------------------"
        echo "[4] ###- Docker and Docker Compose have been installed! ###"

        docker --version
        docker-compose --version