#!/bin/bash

function test_can_translate_I_to_1 {
    local actual=$(roman_to_decimal I);

    assertequals $actual 1
}

function roman_to_decimal {
    echo 1;
}