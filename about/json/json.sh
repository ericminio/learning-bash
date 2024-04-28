#!/bin/bash

source './about/support/utils.sh'

function opening {
    sed -E -e 's/\{\s+/{ /g'
}
function closing {
    sed -E -e 's/\s+\}/ }/g'
}
function semicolon {
    sed -E -e 's/,\s+/, /g'
}
function comma {
    sed -E -e 's/:\s+/:/g'
}

function json {
    oneliner | opening | closing  | semicolon | comma | sed -E 's/(^[ ]*|[ ]*$)//g'
}

