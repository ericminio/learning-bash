#!/bin/bash

function test_default_is_encoding {
    local actual=$(echo hello | base64)

    assertequals $actual "aGVsbG8K"
}

function test_decoding_needs_flag {
    local actual=$(echo aGVsbG8K | base64 -d)

    assertequals $actual "hello"
}
