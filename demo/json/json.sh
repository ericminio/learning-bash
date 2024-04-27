#!/bin/bash

source './demo/support/utils.sh'

function json {
    oneliner | sed -E -e 's/\{\s+/{ /g' | sed -E -e 's/\s+\}/ }/g' | sed -E -e 's/,\s+/, /g' | sed -E -e 's/:\s+/:/g' | sed -E 's/(^[ ]*|[ ]*$)//g'
}

