#!/bin/bash

function test_can_run_several_tests {
    : > ./about/testing/actual
    ./dist/test.sh ./about/testing/examples/several-tests >> ./about/testing/actual
    delta=`diff ./about/testing/actual ./about/testing/tests/expected-several-tests`

    assertequals "$delta" ""
}

function test_can_report_failure {
    : > ./about/testing/actual
    ./dist/test.sh ./about/testing/examples/failure >> ./about/testing/actual
    delta=`diff ./about/testing/actual ./about/testing/tests/expected-failure`

    assertequals "$delta" ""
}

function test_can_run_single_test {
    : > ./about/testing/actual
    echo "#!/bin/bash" > ./about/testing/examples/test-only/two.sh
    echo "function test_only_two {" >> ./about/testing/examples/test-only/two.sh
    echo "    assertequals 2 2" >> ./about/testing/examples/test-only/two.sh
    echo "}" >> ./about/testing/examples/test-only/two.sh
    ./dist/test.sh ./about/testing/examples/test-only >> ./about/testing/actual
    delta=`diff ./about/testing/actual ./about/testing/tests/expected-test-only`
    : > ./about/testing/examples/test-only/two.sh

    assertequals "$delta" ""
}
