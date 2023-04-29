#!/bin/bash

function replace_token {
    find $1 -type f -exec sed -i "s/$2/$3/g" {} \;
}

function test_replace_can_focus_on_path {
    rm -rf ./demo/replace/actual
    cp -R ./demo/replace/data ./demo/replace/actual
    replace_token ./demo/replace/actual "\/me\/" "\/you\/"

    local actual=$(cat ./demo/replace/actual/import)
    assertequals "$actual" "/before/you/after me"
}