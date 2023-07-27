#!/bin/bash
echo "======================================================="
now_name=$(hostname)
echo "======================================================="
echo -n "Enter new hostname: "
read new_name
sudo sed -i "s/${now_name}/${new_name}/g" /etc/hostname
sudo hostnamectl set-hostname ${new_name}
sudo sed -i "s/${now_name}/${new_name}/g" /etc/hosts
echo "======================================================="
echo "New hostname: $(hostname)"
echo "======================================================="
