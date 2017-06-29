#! /bin/sh

source ./extract.section.sh

testThatExtractSectionWorks()
{
    extractSection SpecificException 1 2 input.txt > output.txt

    diff ./output.txt ./expected.txt
    assertTrue 'Expected output differs.' $?
}

# load shunit2
. ../shunit2-2.1.6/src/shunit2
