#!/bin/bash

function test_comment_all {
    sed '/^/s//#&/' ./school/comment/comment.properties > ./school/comment/actual
    local delta=`diff ./school/comment/actual ./school/comment/expected-comment-all`

    assertequals "$delta" ""
}

function test_uncomment_all {
    sed '/^#/s//\1/' ./school/comment/uncomment.properties > ./school/comment/actual
    local delta=`diff ./school/comment/actual ./school/comment/expected-uncomment-all`

    assertequals "$delta" ""
}
