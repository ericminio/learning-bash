#!/bin/bash

source './demo/support/utils.sh'

function json {
    oneliner | compact | sed -e 's/{/{ /g' -e 's/}/ }/g' -e 's/,/, /g'
}

