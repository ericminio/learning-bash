#!/bin/bash

function replace_token {
    echo "$1 -> $2"
    for file in $(grep -rlH "$1" $3); do
        echo $file
        local after=$(sed "s/$1/$2/g" $file)
        echo $after > $file
    done
}

function duplicate_and_adjust {
    rm -rf $2
    cp -R $1 $2
    
    replace_token "\/me\/" "\/you\/" $2
    replace_token "THIS" "THAT" $2
}

function seed_incoming {
    rm -rf $1
    mkdir $1
    echo "/before/me/after me" > $1/import
    echo "VARIABLE_WITH_THIS_NAME=42 # this is great" > $1/variable
    echo "do not touch me" > $1/no
}

function test_replace_can_focus_on_path {
    seed_incoming ./about/replace/incoming
    duplicate_and_adjust ./about/replace/incoming ./about/replace/actual
    local actual=$(cat ./about/replace/actual/import)

    assertequals "$actual" "/before/you/after me"
}

function test_replace_can_focus_on_variable {
    seed_incoming ./about/replace/incoming
    duplicate_and_adjust ./about/replace/incoming ./about/replace/actual
    local actual=$(cat ./about/replace/actual/variable)

    assertequals "$actual" "VARIABLE_WITH_THAT_NAME=42 # this is great"
}

function test_replace_is_strict_with_regex_matching {
    seed_incoming ./about/replace/incoming
    duplicate_and_adjust ./about/replace/incoming ./about/replace/actual
    local actual=$(cat ./about/replace/actual/no)

    assertequals "$actual" "do not touch me"
}