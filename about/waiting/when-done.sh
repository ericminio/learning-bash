#!/bin/bash

source './dist/waiting.sh'

function wait_for_this {
    ls -l | grep "about"
}

function test_waiting_stops_when_done {    
    result=$(waiting "about folder" wait_for_this)

    assertequals "$result" "about folder is ready"
}

