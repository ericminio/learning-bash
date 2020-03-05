#!/bin/sh

function test_can_add {
    local a=1
    local b=2
    local actual=$((a+b))

    assertequals $actual 3
}

