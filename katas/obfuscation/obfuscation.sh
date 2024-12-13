#!/bin/sh

function test_obfuscate_one_word {
    assertequals $(obfuscate "hello") "h***o"
}

function test_obfuscate_two_words_together {
    assertequals $(obfuscate "hello world") "h*********d"
}

function test_obfuscate_one_number {
    assertequals $(obfuscate 1492) "1**2"
}

function test_obfuscate_hide_all_if_two_digits {
    assertequals "$(obfuscate 42)" "**"
}

function test_obfuscate_one_digit {
    assertequals "$(obfuscate 5)" "*"
}

function test_obfuscate_empty_string {
    assertequals "$(obfuscate "")" "*"
}


function obfuscate {
    local word=$1
    local length=${#word}
    if [ $length -eq 0 ]; then
        echo "*"
    elif [ $length -le 2 ]; then
        echo "$(stars $length)"
    else
        local first_char=${word:0:1}
        local last_char=${word:length-1:1}
        local obfuscated=$(stars $(($length - 2)))
        echo "${first_char}${obfuscated}${last_char}"
    fi
}
function stars {
    local length=$1
    for i in $(seq 1 $length); do
        echo -n "*"
    done
}