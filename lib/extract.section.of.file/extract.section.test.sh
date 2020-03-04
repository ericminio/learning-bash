#! /bin/sh

source ./extract.section.sh

testThatExtractSectionWorks()
{
    extractSection SpecificException 1 2 input-single-instance.txt > output.txt

    diff ./output.txt ./expected.txt
    assertTrue 'Expected output differs.' $?
}

testThatExtractSectionSelectsTheFirstMatchingOccurence()
{
    extractSection SpecificException 1 2 input-two-instances.txt > output.txt

    diff ./output.txt ./expected.txt
    assertTrue 'Expected output differs.' $?
}

testThatExtractSectionResistsSectionNotFound()
{
    extractSection SpecificException 1 2 input-no-instance.txt > output.txt

    diff ./output.txt ./expected-empty.txt
    assertTrue 'Expected output differs.' $?
}

# load shunit2
. ../shunit2-2.1.6/src/shunit2
