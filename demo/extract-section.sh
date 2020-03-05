#!/bin/sh

source ./lib/extract-section.sh

function test_extract_section_works_as_expected {
    extractSection SpecificException 1 2 ./demo/extract-section-data/input-single-instance.txt > ./demo/extract-section-data/output.txt
    local delta=`diff ./demo/extract-section-data/output.txt ./demo/extract-section-data/expected.txt`

    assertequals "$delta" ""
}

function test_extract_section_selects_first_occurence {
    extractSection SpecificException 1 2 ./demo/extract-section-data/input-two-instances.txt > ./demo/extract-section-data/output.txt
    local delta=`diff ./demo/extract-section-data/output.txt ./demo/extract-section-data/expected.txt`
    
    assertequals "$delta" ""
}

function test_extract_section_resists_no_occurence {
    extractSection SpecificException 1 2 ./demo/extract-section-data/input-no-instance.txt > ./demo/extract-section-data/output.txt
    local delta=`diff ./demo/extract-section-data/output.txt ./demo/extract-section-data/expected-empty.txt`

    assertequals "$delta" ""
}
