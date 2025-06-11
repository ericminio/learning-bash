#!/bin/bash

function test_roman_I_is_decimal_1 {
    local result=$(roman_to_decimal I)
  
    assertequals $result 1
}

function test_roman_X_is_decimal_10 {
    local result=$(roman_to_decimal X)
  
    assertequals $result 10
}
function test_roman_XXIX_is_decimal_29 {
    local result=$(roman_to_decimal XXIX)
  
    assertequals $result 29
}

function test_roman_MCDXCII_is_decimal_1492 {
    local result=$(roman_to_decimal MCDXCII)
  
    assertequals $result 1492
}
