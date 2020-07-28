#!/bin/bash

if [[ "$(docker stack ls 2> /dev/null)" == "" ]]; then
docker stack deploy --compose-file docker-compose.yaml DnDservice
fi

if [[ "$(docker stack ls 2> /dev/null)" == "DnDservice" ]]; then
docker pull -q paullagah/service_1:latest
docker pull -q paullagah/service_2:latest
docker pull -q paullagah/service_3:latest
docker pull -q paullagah/service_4:latest
docker service update --image paullagah/service_1:latest DnDservice_service_1
docker service update --image paullagah/service_2:latest DnDservice_service_2
docker service update --image paullagah/service_3:latest DnDservice_service_3
docker service update --image paullagah/service_4:latest DnDservice_service_4
fi