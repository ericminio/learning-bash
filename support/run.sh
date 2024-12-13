#!/bin/bash

FOLDER=$1

path="./$FOLDER"
if [ -z "$FOLDER" ]; then
    path="./school"
fi

clear
docker-compose -f support/ci/docker-compose.yml run -T --rm bash support/yop-testing-bash/dist/test.sh $path
