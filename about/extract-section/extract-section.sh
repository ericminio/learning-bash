#!/bin/bash

source ./dist/extract-section.sh

function test_extract_section_works_as_expected {
    extractSection SpecificException 1 2 ./about/extract-section/input-single-instance.txt > ./about/extract-section/actual
    local delta=`diff ./about/extract-section/actual ./about/extract-section/expected`

    assertequals "$delta" ""
}

function test_extract_section_selects_first_occurence {
    extractSection SpecificException 1 2 ./about/extract-section/input-two-instances.txt > ./about/extract-section/actual
    local delta=`diff ./about/extract-section/actual ./about/extract-section/expected`
    
    assertequals "$delta" ""
}

function test_extract_section_resists_no_occurence {
    extractSection SpecificException 1 2 ./about/extract-section/input-no-instance.txt > ./about/extract-section/actual
    local delta=`diff ./about/extract-section/actual ./about/extract-section/expected-empty`

    assertequals "$delta" ""
}
