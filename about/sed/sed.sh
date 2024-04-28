#!/bin/bash

function test_sed_can_replace_word_in_one_file {
    echo "find me" > ./about/sed/incoming
    sed -i 's/me/you/g' ./about/sed/incoming
    local actual=$(cat ./about/sed/incoming)

    assertequals "$actual" "find you"
}

function test_sed_is_case_sensitive {
    echo "find me" > ./about/sed/incoming
    sed -i 's/Me/you/g' ./about/sed/incoming
    local actual=$(cat ./about/sed/incoming)

    assertequals "$actual" "find me"
}

function test_sed_needs_correct_regexp_mod_to_be_case_insensitive {
    echo "find me" > ./about/sed/incoming
    sed -i 's/Me/you/gi' ./about/sed/incoming
    local actual=$(cat ./about/sed/incoming)

    assertequals "$actual" "find you"
}

function test_find_and_sed_to_replace_in_folder { 
    echo "" > ./about/sed/actual
    find ./about/sed/data/* -exec sed 's/me/you/g' {} >> ./about/sed/actual \; 
    local delta=`diff ./about/sed/actual ./about/sed/expected`

    assertequals "$delta" ""
}

function test_grep_and_sed_to_replace_in_folder { 
    echo "" > ./about/sed/actual
    grep -rl me ./about/sed/data | xargs sed 's/me/you/g' >> ./about/sed/actual
    local delta=`diff ./about/sed/actual ./about/sed/expected`

    assertequals "$delta" ""
}