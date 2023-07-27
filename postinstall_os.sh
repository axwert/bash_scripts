#!/bin/bash

if [ -f /etc/os-release ] && grep -qi "ubuntu\|debian" /etc/os-release; then
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y vim tmux htop git curl wget unzip make nano net-tools
fi

if [ -f /etc/os-release ] && grep -qi "centos\|fedora" /etc/os-release; then
    sudo yum update -y
    sudo yum install -y vim tmux htop git curl wget unzip make nano net-tools
fi