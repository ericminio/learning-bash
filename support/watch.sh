#!/bin/bash

FOLDER=$1

path="./$FOLDER"
if [ -z "$FOLDER" ]; then
    path="./school"
fi

./support/run.sh $path
fswatch -o $path -e "actual" -e "incoming" | xargs -n1 ./support/run.sh $path