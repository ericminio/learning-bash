#!/bin/bash

function test_sed_can_replace_word_in_one_file {
    echo "find me" > ./demo/sed/incoming
    sed -i 's/me/you/g' ./demo/sed/incoming
    local actual=$(cat ./demo/sed/incoming)

    assertequals "$actual" "find you"
}

function test_sed_is_case_sensitive {
    echo "find me" > ./demo/sed/incoming
    sed -i 's/Me/you/g' ./demo/sed/incoming
    local actual=$(cat ./demo/sed/incoming)

    assertequals "$actual" "find me"
}

function test_sed_needs_correct_regexp_mod_to_be_case_insensitive {
    echo "find me" > ./demo/sed/incoming
    sed -i 's/Me/you/gi' ./demo/sed/incoming
    local actual=$(cat ./demo/sed/incoming)

    assertequals "$actual" "find you"
}

function test_find_and_sed_to_replace_in_folder { 
    echo "" > ./demo/sed/actual
    find ./demo/sed/data/* -exec sed 's/me/you/g' {} >> ./demo/sed/actual \; 
    local delta=`diff ./demo/sed/actual ./demo/sed/expected`

    assertequals "$delta" ""
}

function test_grep_and_sed_to_replace_in_folder { 
    echo "" > ./demo/sed/actual
    grep -rl me ./demo/sed/data | xargs sed 's/me/you/g' >> ./demo/sed/actual
    local delta=`diff ./demo/sed/actual ./demo/sed/expected`

    assertequals "$delta" ""
}