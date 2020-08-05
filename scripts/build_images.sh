#!/bin/bash

# Print image list before build -> Build Service 1 image 
echo $(docker images)
docker build --no-cache -t paullagah/service_1 ./Service_1
docker push paullagah/service_1:latest

# Build Service 2 image 
docker build --no-cache -t paullagah/service_2 ./Service_2
docker push paullagah/service_2:latest

# Build Service 3 image 
docker build --no-cache -t paullagah/service_3 ./Service_3
docker push paullagah/service_3:latest

# Build Service 4 image 
docker build --no-cache -t paullagah/service_4 ./Service_4
docker push paullagah/service_4:latest

# Build NGINX image -> print image list after build
docker build --no-cache -t paullagah/nginx ./NGINX
docker push paullagah/nginx:latest
echo $(docker images)
