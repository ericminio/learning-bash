#!/bin/bash

function test_cut_field_index_starts_with_one {
    local actual=`{
        echo 'Diana has beauty'
        echo 'Bruce has money'
        echo 'Clark has love'
    } | grep love | cut -d" " -f1`

    assertequals "$actual" "Clark"
}