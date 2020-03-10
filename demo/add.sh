#!/bin/bash

function test_addition {
    local a=1
    local b=2
    local actual=$(( a + b ))

    assertequals $actual 5
}

