#!/bin/bash

docker build -t paullagah/service_1 ./Service_1
docker tag paullagah/service_1:latest paullagah/service_1:update
docker push paullagah/service_4:update
docker build -t paullagah/service_2 ./Service_2
docker tag paullagah/service_2:latest paullagah/service_2:update
docker push paullagah/service_4:update
docker build -t paullagah/service_3 ./Service_3
docker tag paullagah/service_3:latest paullagah/service_3:update
docker push paullagah/service_4:update
docker build -t paullagah/service_4 ./Service_4
docker tag paullagah/service_4:latest paullagah/service_4:update 
docker push paullagah/service_4:update