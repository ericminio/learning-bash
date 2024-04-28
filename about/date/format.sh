#!/bin/bash

function test_formatting_requires_config {
    local actual=$(date -d "2023-09-21" +"date is %Y-%m-%d")

    assertequals "$actual" "date is 2023-09-21"
}

