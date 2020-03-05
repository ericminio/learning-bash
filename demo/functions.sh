#!/bin/sh

function sut {
    echo "hello world :)"
}

function test_can_return_value {
    local actual=$(sut)

    assertequals "$actual" "hello world :)"
}

