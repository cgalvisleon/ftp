#!/bin/bash

# stop the running stack ftp
docker stack rm ftp

# pull the latest changes from the remote repository
git get

# build the new image
docker build --no-cache -t my-ftp -f ./Dockerfile .

# deploy the stack ftp
docker stack deploy -c ./ftp.yml ftp

# list the running containers
docker ps -a