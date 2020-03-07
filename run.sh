#!/bin/bash

source ./lib/assert.sh
for f in ./demo/*.sh; do source $f; done

function run_test {
    echo $1
    $1 
    if [ "$?" != "0" ]; then
        echo -e "$FAILED_EXPECTATION"
        exit 1
    fi
}

if (( `grep test_only_ ./demo/*.sh | wc -l` > 0 )); then
    
    for test_method in `grep test_only_ ./demo/*.sh | cut -d" " -f2`; do 
        run_test $test_method
    done
else
    for test_method in `grep test_ ./demo/*.sh | cut -d" " -f2`; do 
        run_test $test_method
    done
fi

echo "SUCCESS"