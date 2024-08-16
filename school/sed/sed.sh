#!/bin/bash

function test_sed_can_replace_word_in_one_file {
    echo "find me" > ./school/sed/incoming
    sed -i 's/me/you/g' ./school/sed/incoming
    local actual=$(cat ./school/sed/incoming)

    assertequals "$actual" "find you"
}

function test_sed_is_case_sensitive {
    echo "find me" > ./school/sed/incoming
    sed -i 's/Me/you/g' ./school/sed/incoming
    local actual=$(cat ./school/sed/incoming)

    assertequals "$actual" "find me"
}

function test_sed_needs_correct_regexp_mod_to_be_case_insensitive {
    echo "find me" > ./school/sed/incoming
    sed -i 's/Me/you/gi' ./school/sed/incoming
    local actual=$(cat ./school/sed/incoming)

    assertequals "$actual" "find you"
}

function test_find_and_sed_to_replace_in_folder { 
    echo "" > ./school/sed/actual
    find ./school/sed/data/* -exec sed 's/me/you/g' {} >> ./school/sed/actual \; 
    local delta=`diff ./school/sed/actual ./school/sed/expected`

    assertequals "$delta" ""
}

function test_grep_and_sed_to_replace_in_folder { 
    echo "" > ./school/sed/actual
    grep -rl me ./school/sed/data | xargs sed 's/me/you/g' >> ./school/sed/actual
    local delta=`diff ./school/sed/actual ./school/sed/expected`

    assertequals "$delta" ""
}