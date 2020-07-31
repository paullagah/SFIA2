#!/bin/bash
source /var/lib/jenkins/.bashsrc
docker stack deploy --compose-file docker-compose.yaml DnDservice

