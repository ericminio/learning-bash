#!/bin/bash

function oneliner {
    tr -d '\r\n'
}

function shrink {
    sed -E 's/[ ]+/ /g'
}

function trim {
    oneliner | shrink | sed -E 's/(^[ ]*|[ ]*$)//g'
}

