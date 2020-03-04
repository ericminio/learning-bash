#!/bin/bash

function test_grep_can_extract_matching_lines {
    local actual=`{
        echo 'this is line 1'
        echo 'line 2 has love'
        echo 'this is line 3'
    } | grep love`

    assertequals "$actual" "line 2 has love"
}

function test_grep_can_match_a_string {
    local actual=`{
        echo 'this is line 1'
        echo 'line 2 has love'
        echo 'line 3 has love too'
        echo 'this is line 4'
    } | grep "love too"`

    assertequals "$actual" "line 3 has love too"
}

function test_grep_offers_inversion {
    local actual=`{
        echo 'line 1 has love'
        echo 'line 2 has not'
    } | grep -v love`

    assertequals "$actual" "line 2 has not"
}