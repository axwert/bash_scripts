#!/bin/bash
sudo apt install postgresql -y
echo "======================================================="
read -p "Enter new password for postgres: " pass_postgres
read -p "Enter new DB: " new_db
read -p "Enter new user: " new_user
read -p "Enter password for new user: " pass_new_user
read -p "Enter listen address: " listen_address
read -p "Enter network access: " network_access
echo "======================================================="
echo "postgres:$pass_pstgres" | sudo chpasswd

su_psql="sudo -u postgres psql -c"

$su_psql "alter user postgres with password '$pass_postgres';"
$su_psql "create database $new_db;"
$su_psql "create user $new_user with encrypted password '$pass_new_user';"
$su_psql "grant all privileges on database $new_db to $new_user;"
echo "======================================================="
$su_psql "\l $new_db"
echo "======================================================="
$su_psql "\du $new_user"

echo "listen_addresses = '$listen_address'" | sudo tee -a /etc/postgresql/13/main/postgresql.conf > /dev/null
echo "host    $new_db     $new_user     $network_access     md5" | sudo tee -a /etc/postgresql/13/main/pg_hba.conf > /dev/null

sudo systemctl restart postgresql
echo "======================================================="
echo "############### INSTALLATION SUCCESSFUL ###############"
echo "======================================================="
