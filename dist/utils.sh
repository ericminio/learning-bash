#!/bin/bash

function oneliner {
    tr -d '\r\n'
}

function shrink {
    sed -E 's/\s+/ /g'
}
function trim {
    oneliner | shrink | sed -E 's/(^\s*|\s*$)//g'
}

function opening {
    sed -E -e 's/\{\s+/{ /g'
}
function closing {
    sed -E -e 's/\s+\}/ }/g'
}
function comma {
    sed -E -e 's/,\s+/, /g'
}
function colon {
    sed -E -e 's/:\s+/:/g'
}
function json {
    oneliner | opening | closing  | comma | colon | sed -E 's/(^[ ]*|[ ]*$)//g'
}

