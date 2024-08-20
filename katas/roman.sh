#!/bin/bash

function test_ready {
    local actual=42

    assertequals $actual 42
}

