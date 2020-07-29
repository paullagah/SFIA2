#!/bin/bash

if [[ "$(docker stack ls 2> /dev/null)" == "" ]]; then
docker stack deploy --compose-file docker-compose.yaml DnDservice
fi

if [[ "$(docker stack ls 2> /dev/null)" == "DnDservice" ]]; then
docker push paullagah/service_1:latest
docker service update --image paullagah/service_1:latest DnDservice_service_1
docker push paullagah/service_2:latest
docker service update --image paullagah/service_2:latest DnDservice_service_2
docker push paullagah/service_3:latest
docker service update --image paullagah/service_3:latest DnDservice_service_3
docker push paullagah/service_4:latest
docker service update --image paullagah/service_4:latest DnDservice_service_4
docker rmi $(docker images -f "dangling=true" -q) -f
fi