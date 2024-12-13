#!/bin/bash

function test_roman_I_is_decimal_1 {
    local result=$(roman_to_decimal I)
  
    assertequals $result 1
}
function test_roman_II_is_decimal_2 {
    local result=$(roman_to_decimal II)
  
    assertequals $result 2
}
function test_roman_XXX_is_decimal_33 {
    local result=$(roman_to_decimal XXXIII)
  
    assertequals $result 33
}
function test_roman_XL_is_decimal_40 {
    local result=$(roman_to_decimal XL)
  
    assertequals $result 40
}