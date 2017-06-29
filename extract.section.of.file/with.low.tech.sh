#! /bin/sh

testThatHeadAndTailCanDoIt()
{
    line=`grep -n SpecificException input.txt | cut -f1 -d':'`
    cat -n input.txt | head -n $((line+2)) | tail -n 4 > output.txt

    diff ./output.txt ./expected.txt
    assertTrue 'Expected output differs.' $?
}

# load shunit2
. ../shunit2-2.1.6/src/shunit2
