#!/bin/bash

sudo apt-add-repository ppa:ansible/ansible
sudo apt update -y
sudo apt upgrade -y
sudo apt install ansible -y

ansible-playbook -i inventory.cfg playbook.yml