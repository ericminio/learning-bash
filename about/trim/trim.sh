#!/bin/bash

source './dist/utils.sh'

function trim {
    oneliner | shrink | sed -E 's/(^\s*|\s*$)//g'
}

