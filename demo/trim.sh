#!/bin/bash

function trim {
    xargs echo
}

function test_trim_can_remove_leading_and_trailing_spaces {
    local input=" 123 "
    local actual=$(printf "%s" "$input" | trim)

    assertequals "$actual" "123"
}

