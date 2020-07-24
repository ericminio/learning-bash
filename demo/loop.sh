#!/bin/bash

function test_for_through_values {
    local sum=0
    for i in 1 2 3; do
        sum=$(( sum + $i))
    done

    assertequals $sum 6
}

function test_for_through_interval {
    local sum=0
    for i in {1..4}; do
        sum=$(( sum + $i))
    done

    assertequals $sum 10
}

function test_for_through_interval_with_variable {
    local sum=0
    local count=5
    for ((i=0; i<=$count; i++)); do
        sum=$(( sum + $i))
    done

    assertequals $sum 15
}
