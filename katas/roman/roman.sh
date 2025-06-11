#!/bin/bash

romans=(
    M 1000
    CM 900
    D 500
    CD 400
    C 100
    XC 90
    L 50
    XL 40
    X 10
    IX 9
    V 5
    IV 4
    I 1
)

function roman_to_decimal {
    local roman=$1
    local value=0
    local i=0

    while [[ -n $roman ]]; do
        local symbol=${romans[i]}
        local number=${romans[i+1]}
        if [[ $roman == $symbol* ]]; then
            value=$((value + number))
            roman=${roman#$symbol}
        else
            i=$((i + 2))
        fi
    done

    echo $value
}
