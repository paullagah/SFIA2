#!/bin/bash

docker service update --image paullagah/service_1:latest DnDservice_service_1
docker service update --image paullagah/service_2:latest DnDservice_service_2
docker service update --image paullagah/service_3:latest DnDservice_service_3
docker service update --image paullagah/service_4:latest DnDservice_service_4

docker system prune -f