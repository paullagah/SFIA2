#!/bin/bash

docker build --no-cache -t paullagah/service_1 ./Service_1
docker push paullagah/service_1:latest
docker build --no-cache -t paullagah/service_2 ./Service_2
docker push paullagah/service_2:latest
docker build --no-cache -t paullagah/service_3 ./Service_3
docker push paullagah/service_3:latest
docker build --no-cache -t paullagah/service_4 ./Service_4
docker push paullagah/service_4:latest