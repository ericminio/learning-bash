#!/bin/bash

./support/katas/run.sh
fswatch -o ./katas -e "run.output" | xargs -n1 ./support/katas/run.sh