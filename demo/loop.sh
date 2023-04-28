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
    local numbers=(10 20 30)
    for i in ${numbers[@]}; do
        sum=$(( sum + $i))
    done

    assertequals $sum 60
}

function test_loop_through_array_indices {
    local sum=0
    local numbers=(10 20 30)
    for i in ${!numbers[@]}; do
        sum=$(( sum + $i))
    done

    assertequals $sum 3
}

function test_loop_through_sub_array_numbers {
    local sum=0
    local numbers=("1:one" "2:two" "3:three")
    for item in ${numbers[@]}; do
        local split=(${item//:/ })
        local value=split[0]
        sum=$(( sum + $value))
    done

    assertequals $sum 6
}

function test_loop_through_sub_array_strings {
    local sum=""
    local numbers=("1->one" "2->two" "3->three")
    for item in ${numbers[@]}; do
        local split=(${item//->/ })
        local value=${split[1]}
        sum="$sum$value"
    done

    assertequals "$sum" "onetwothree"
}