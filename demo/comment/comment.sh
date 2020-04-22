#!/bin/bash

function test_comment_all {
    sed '/^/s//#&/' ./demo/comment/comment.properties > ./demo/comment/actual
    local delta=`diff ./demo/comment/actual ./demo/comment/expected-comment-all`

    assertequals "$delta" ""
}

function test_uncomment_all {
    sed '/^#/s//\1/' ./demo/comment/uncomment.properties > ./demo/comment/actual
    local delta=`diff ./demo/comment/actual ./demo/comment/expected-uncomment-all`

    assertequals "$delta" ""
}
