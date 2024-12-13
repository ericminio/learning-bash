#!/bin/bash

source './support/yop-testing-bash/dist/utils.sh'

function test_json_can_be_written_with_multiple_lines {
    local input=$'{  
        "alive": true,
        "value": 42
    }'
    local body=$(printf "%s" "$input" | json)    

    assertequals "$body" '{ "alive":true, "value":42 }'
}

