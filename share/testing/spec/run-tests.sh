#!/bin/bash

function test_can_run_several_tests {
    : > ./share/testing/spec/actual
    ./share/testing/lib/test.sh ./share/testing/examples/several-tests >> ./share/testing/spec/actual
    delta=`diff ./share/testing/spec/actual ./share/testing/spec/expected-several-tests`

    assertequals "$delta" ""
}

function test_can_report_failure {
    : > ./share/testing/spec/actual
    ./share/testing/lib/test.sh ./share/testing/examples/failure >> ./share/testing/spec/actual
    delta=`diff ./share/testing/spec/actual ./share/testing/spec/expected-failure`

    assertequals "$delta" ""
}

function test_can_run_single_test {
    : > ./share/testing/spec/actual
    ./share/testing/lib/test.sh ./share/testing/examples/test-only >> ./share/testing/spec/actual
    delta=`diff ./share/testing/spec/actual ./share/testing/spec/expected-test-only`

    assertequals "$delta" ""
}
