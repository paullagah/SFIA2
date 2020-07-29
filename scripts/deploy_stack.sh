#!/bin/bash

if [[ "$(docker stack services DnDservice 2> /dev/null)" == "" ]]; then
    docker stack deploy --compose-file docker-compose.yaml DnDservice
fi

