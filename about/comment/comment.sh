#!/bin/bash

function test_comment_all {
    sed '/^/s//#&/' ./about/comment/comment.properties > ./about/comment/actual
    local delta=`diff ./about/comment/actual ./about/comment/expected-comment-all`

    assertequals "$delta" ""
}

function test_uncomment_all {
    sed '/^#/s//\1/' ./about/comment/uncomment.properties > ./about/comment/actual
    local delta=`diff ./about/comment/actual ./about/comment/expected-uncomment-all`

    assertequals "$delta" ""
}
