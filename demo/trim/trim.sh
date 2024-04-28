#!/bin/bash

source './demo/support/utils.sh'

function trim {
    oneliner | shrink | sed -E 's/(^\s*|\s*$)//g'
}

