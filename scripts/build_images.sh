#!/bin/bash

# Build Service 1 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_1:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_1 ./Service_1 
fi

# Build Service 2 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_2:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_2 ./Service_2
fi

# Build Service 3 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_3:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_3 ./Service_3
fi

# Build Service 4 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_4:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_4 ./Service_4
fi