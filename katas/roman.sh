#!/bin/bash

romans=(
    XL 40 
    X 10 
    I 1
);

function roman_to_decimal {
    local value=0;
    local current=$1;

    for ((i=0; i<${#romans[@]}; i+=2)); do
        local candidate=${romans[i]};
        local candidate_value=${romans[i+1]};
        local candidate_length=${#candidate};
        while [ "${current:0:$candidate_length}" == $candidate ]; do
            value=$((value + $candidate_value));
            current="${current:$candidate_length}";
        done
    done
    
    echo $value;
}
