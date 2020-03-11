#!/bin/bash

function test_run {
    : > ./share/testing/actual

    ./share/testing/lib/test.sh ./share/testing/data/several-tests >> ./share/testing/actual
    ./share/testing/lib/test.sh ./share/testing/data/failure >> ./share/testing/actual
    ./share/testing/lib/test.sh ./share/testing/data/test-only >> ./share/testing/actual

    delta=`diff ./share/testing/actual ./share/testing/expected`

    assertequals "$delta" ""
}
