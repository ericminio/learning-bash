#!/bin/sh

source ./lib/assert.sh
for f in ./demo/*.sh; do source $f; done

for test_method in `grep test_ ./demo/*.sh | cut -d" " -f2`; do 
    echo $test_method
    $test_method 
    if [ "$?" != "0" ]; then
        echo -e "$FAILED_EXPECTATION"
        exit 1
    fi
done

echo "SUCCESS"