#!/bin/bash

# Print image list before build -> Build Service 1 image 
echo $(docker images)
docker build --no-cache -t paullagah/service_1 ./Service_1

# Build Service 2 image 
docker build --no-cache -t paullagah/service_2 ./Service_2

# Build Service 3 image 
docker build --no-cache -t paullagah/service_3 ./Service_3

# Build Service 4 image -> print image list after build
docker build --no-cache -t paullagah/service_4 ./Service_4
echo $(docker images)
