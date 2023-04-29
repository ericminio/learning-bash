#!/bin/bash

function replace_token {
    find $3 -type f -exec sed -i "s/$1/$2/g" {} \;
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
}

function test_replace_can_focus_on_path {
    seed_incoming ./demo/replace/incoming
    duplicate_and_adjust ./demo/replace/incoming ./demo/replace/actual
    local actual=$(cat ./demo/replace/actual/import)

    assertequals "$actual" "/before/you/after me"
}

function test_replace_can_focus_on_variable {
    seed_incoming ./demo/replace/incoming
    duplicate_and_adjust ./demo/replace/incoming ./demo/replace/actual
    local actual=$(cat ./demo/replace/actual/variable)

    assertequals "$actual" "VARIABLE_WITH_THAT_NAME=42 # this is great"
}