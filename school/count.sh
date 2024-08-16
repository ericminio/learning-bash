#!/bin/bash

function test_wc_can_count_lines {
    local actual=`{
        echo 'Diana has beauty'
        echo 'Bruce has money'
        echo 'Clark has love'
    } | wc -l`

    assertequals $actual 3
}