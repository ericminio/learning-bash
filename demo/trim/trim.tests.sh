#!/bin/bash

source './demo/trim/trim.sh'

function inspect {
    printf "%s" "$1" | od -c
}

function test_trim_can_remove_leading_spaces {
    local input=$'   123'
    local actual=$(printf "%s" "$input" | trim)    

    assertequals "$actual" "123"
}

function test_trim_can_remove_trailing_spaces {
    local input=$'123   '
    local actual=$(printf "%s" "$input" | trim)    

    assertequals "$actual" "123"
}

function test_trim_preserves_inner_spaces {
    local input=$' 1 2 3 '
    local actual=$(printf "%s" "$input" | trim)

    assertequals "$actual" "1 2 3"
}

function test_trim_can_remove_trailing_cr_lf {
    local input=$'123\r\n\n'    
    local actual=$(printf "%s" "$input" | trim)    
    
    assertequals "$actual" "123"
}

function test_trim_can_remove_leading_cr_lf {
    local input=$'\r\n\n123'
    local actual=$(printf "%s" "$input" | trim)
    
    assertequals "$actual" "123"
}

function test_trim_digests_grep_one_line {
    echo "hello " > ./demo/incoming
    echo "world" >> ./demo/incoming
    local actual=$(cat ./demo/incoming | grep "hello" | trim)

    assertequals "$actual" "hello"
}

function test_trim_digests_grep_two_lines {
    echo "hello world     " > ./demo/incoming
    echo "hello my friend" >> ./demo/incoming
    echo "bye for now    " >> ./demo/incoming
    local actual=$(cat ./demo/incoming | grep "hello" | trim)    

    assertequals "$actual" "hello world hello my friend"
}


