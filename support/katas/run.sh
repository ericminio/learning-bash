#!/bin/bash

clear
docker-compose -f support/ci/docker-compose.yml run -T --rm bash support/yop-testing-bash/dist/test.sh ./katas
