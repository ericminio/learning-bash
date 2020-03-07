#!/bin/bash

function test_length {
    local a=11333
    local length=${#a}

    assertequals $length 5
}

