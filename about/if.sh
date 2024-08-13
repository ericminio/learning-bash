#!/bin/bash

function yes {
    value=42
    if [ $value -eq 42 ]; then
        echo "yes"
    else
        echo "no"
    fi
}
function yes_string {
    value="hello world"
    check="hello world"
    if [ "$value" = "$check" ]; then
        echo "yes"
    else
        echo "no"
    fi
}
function yes_matching_regexp {
    value="hello world!"
    pattern="world"
    if [[ "$value" =~ $pattern ]]; then
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
function no_string {
    value="hello world"
    check="hello"
    if [ "$value" = "$check" ]; then
        echo "yes"
    else
        echo "no"
    fi
}
function no_matching_regexp {
    value="hello world!"
    pattern="world$"
    if [[ "$value" =~ $pattern ]]; then
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

function test_if_strings_equal {
    local actual=$(yes_string)

    assertequals "$actual" "yes"
}

function test_if_strings_do_not_equal {
    local actual=$(no_string)

    assertequals "$actual" "no"
}

function test_if_string_matches {
    local actual=$(yes_matching_regexp)

    assertequals "$actual" "yes"
}

function test_if_string_does_not_match {
    local actual=$(no_matching_regexp)

    assertequals "$actual" "no"
}