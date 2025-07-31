#!/bin/bash

#create src directory if it doesn't exist
if [ ! -d "src" ]; then
    mkdir src
fi

echo "Stopping and removing containers..."
docker-compose down --remove-orphans
docker-compose pull
docker-compose up -d --build --force-recreate
