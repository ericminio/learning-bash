#!/bin/bash

source ./share/extract-section.sh

function test_extract_section_works_as_expected {
    extractSection SpecificException 1 2 ./demo/extract-section/input-single-instance.txt > ./demo/extract-section/actual
    local delta=`diff ./demo/extract-section/actual ./demo/extract-section/expected`

    assertequals "$delta" ""
}

function test_extract_section_selects_first_occurence {
    extractSection SpecificException 1 2 ./demo/extract-section/input-two-instances.txt > ./demo/extract-section/actual
    local delta=`diff ./demo/extract-section/actual ./demo/extract-section/expected`
    
    assertequals "$delta" ""
}

function test_extract_section_resists_no_occurence {
    extractSection SpecificException 1 2 ./demo/extract-section/input-no-instance.txt > ./demo/extract-section/actual
    local delta=`diff ./demo/extract-section/actual ./demo/extract-section/expected-empty`

    assertequals "$delta" ""
}
