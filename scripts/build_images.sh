#!/bin/bash

# Build Service 1 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_1:latest 2> /dev/null)" == "" ]]; then
    docker build -t paullagah/service_1 ../Service_1
fi

# Build Service 2 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_1:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_1 ../Service_1
fi

# Build Service 3 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_1:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_1 ../Service_1
fi

# Build Service 4 image if it doesn't exist
if [[ "$(docker images -q paullagah/service_1:latest 2> /dev/null)" == "" ]]; then
docker build -t paullagah/service_1 ../Service_1
fi