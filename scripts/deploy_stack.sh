#!/bin/bash

# Deploy Stack after passing Variables
source /var/lib/jenkins/.bashrc
docker stack deploy --compose-file docker-compose.yaml DnDservice

