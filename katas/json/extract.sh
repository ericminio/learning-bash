#!/bin/bash

source './support/yop-testing-bash/dist/utils.sh'

function json_extract {
    grep -o "\"$1\":[^,}]*" | head -1 | cut -d':' -f2 | trim | sed 's/"//g'
}

function test_json_extract_first_value {
    local input='{ "alive":true, "value":42 }'
    local actual=$(printf "%s" "$input" | json_extract "alive")    

    assertequals "$actual" "true"
}

function test_json_extract_second_value {
    local input='{ "alive":true, "value":42 }'
    local actual=$(printf "%s" "$input" | json_extract "value")    

    assertequals "$actual" "42"
}

function test_json_extract_string {
    local input='{ "value":"Batman" }'
    local actual=$(printf "%s" "$input" | json_extract "value")    

    assertequals "$actual" "Batman"
}

function test_json_extract_string_with_spaces {
    local input='{ "value":"Wonder Woman" }'
    local actual=$(printf "%s" "$input" | json_extract "value")    

    assertequals "$actual" "Wonder Woman"
}

function test_json_extract_first_match {
    local input='{ 
        "id":1, 
        "user": { 
            "id":2 
        },
        product: {
            "id":3
        }
    }'
    local actual=$(printf "%s" "$input" | json | json_extract "id")    

    assertequals "$actual" "1"
}

