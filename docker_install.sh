#!/bin/bash

docker_install_start(){
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo chmod +x get-docker.sh
    ./get-docker.sh &
    wait $!
    echo "Docker installation is complete!"
}

user_mod() {
    if groups $USER | grep -qw 'docker'; then
        sudo gpasswd --delete $USER docker
    else
        sudo usermod -aG docker $USER
        echo "User is added to the docker group"
    fi
}

docker_install_chek() {
    if command -v docker &>/dev/null; then
        echo "Docker is already installed!"
    else
        if command -v curl &>/dev/null; then
            docker_install
            user_mod
             
        else
            sudo apt update
            sudo apt install -y curl
            docker_install
            user_mod
        fi
    fi
    if command -v docker &>/dev/null && command -v curl &>/dev/null; then
    echo "======================================================="
    echo "############### INSTALLATION SUCCESSFUL ###############"
    echo "======================================================="
    fi
}

docker_install_chek