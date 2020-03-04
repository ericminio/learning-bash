#!/bin/bash

source ./lib/assert.sh
for f in ./demo/*.sh; do source $f; done

for test_method in `declare -F | grep test_ | cut -d" " -f3`; do 
    echo $test_method
    $test_method 
    if [ "$?" != "0" ]; then
        echo -e "$FAILED_EXPECTATION"
        exit 1
    fi
done

echo "SUCCESS"