#!/bin/bash

function oneliner {
    tr -d '\r\n'
}

function shrink {
    sed -E 's/[ ]+/ /g'
}

function compact {
    tr -d ' '
}
