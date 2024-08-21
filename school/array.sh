#!/bin/bash

function test_array_access_one_element {
    local a=(1 2 42)

    assertequals $((a[2])) 42
}

function test_array_access_all_elements {
    local a=(1 2 42)

    assertequals "${a[*]}" "1 2 42"
}

function test_array_size {
    local a=(1 2 42)

    assertequals ${#a[@]} 3
}

function test_array_add_element {
    local a=(1 2 42)
    a+=(7)

    assertequals "${a[*]}" "1 2 42 7"
}

function test_array_remove_element {
    local a=(1 2 42)
    unset a[1]

    assertequals "${a[*]}" "1 42"
}

function test_array_remove_element_updates_size {
    local a=(1 2 42)
    unset a[1]

    assertequals ${#a[@]} 2
}

function test_array_loop {
    local a=(1 2 42)
    local result=0

    for i in "${a[@]}"; do
        result=$((result + i))
    done

    assertequals $result 45
}

function test_array_loop_with_index {
    local a=(1 2 42)
    local result=0

    for i in "${!a[@]}"; do
        result=$((result + a[i]))
    done

    assertequals $result 45
}

function test_loop_modifying_index_in_for_statement {
    local a=(1 2 42)
    local result=0

    for ((i=0; i<${#a[@]}; i++)); do
        result=$((result + a[i]))
    done

    assertequals $result 45
}

function test_associative_array_loop {
    declare -A a=(["key1"]=15 ["key2"]=42)
    local result=0

    for i in "${a[@]}"; do
        result=$((result + i))
    done

    assertequals $result 57
}

function test_associative_array_the_indexes_are_the_keys {
    declare -A a=(["key1"]=15 ["key2"]=42)
    local result=""

    for i in "${!a[@]}"; do
        result="$result \n $i"
    done
    local count=$(echo -e "$result" | grep "key" | wc -l)

    assertequals $count 2
}
