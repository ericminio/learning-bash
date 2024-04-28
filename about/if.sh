#!/bin/bash

function yes {
    value=42
    if [ $value -eq 42 ]; then
        echo "yes"
    else
        echo "no"
    fi
}
function no {
    value=15
    if [ $value -eq 42 ]; then
        echo "yes"
    else
        echo "no"
    fi
}

function test_if_number_equals_42 {
    local actual=$(yes)

    assertequals "$actual" "yes"
}

function test_if_number_does_not_equal_42 {
    local actual=$(no)

    assertequals "$actual" "no"
}
