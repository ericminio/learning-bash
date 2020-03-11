#!/bin/bash

function test_run {
    : > ./share/testing/actual

    ./share/testing/lib/test.sh ./share/testing/examples/several-tests >> ./share/testing/actual
    ./share/testing/lib/test.sh ./share/testing/examples/failure >> ./share/testing/actual
    ./share/testing/lib/test.sh ./share/testing/examples/test-only >> ./share/testing/actual

    delta=`diff ./share/testing/actual ./share/testing/expected`

    assertequals "$delta" ""
}
