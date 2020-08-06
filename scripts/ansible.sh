#!/bin/bash

apt-add-repository ppa:ansible/ansible
apt update -y
apt upgrade -y
apt install ansible -y

ansible-playbook -i inventory.cfg playbook.yml