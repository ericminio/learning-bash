#!/bin/bash

function oneliner {
    tr -d '\r\n'
}

function compact {
    oneliner | tr -d ' '
}

function json {
    oneliner | compact | sed 's/{/{ /g' | sed 's/}/ }/g' | sed 's/,/, /g'
}

