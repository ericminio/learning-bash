#!/bin/bash

function test_loop_through_values {
    local sum=0
    for i in 1 2 3; do
        sum=$(( sum + $i))
    done

    assertequals $sum 6
}

function test_loop_through_interval {
    local sum=0
    for i in {1..4}; do
        sum=$(( sum + $i))
    done

    assertequals $sum 10
}

function test_loop_through_array {
    local sum=0
    local numbers=(1 2 3)
    for i in ${numbers[@]}; do
        sum=$(( sum + $i))
    done

    assertequals $sum 6
}
