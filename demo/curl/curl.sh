#!/bin/bash

function answer {
    read request
    (echo $request | sed 's/\r$//') >> ./demo/curl/incoming
    read host
    (echo $host | sed 's/\r$//') >> ./demo/curl/incoming
    read authorization
    (echo $authorization | sed 's/\r$//') >> ./demo/curl/incoming

    credentials=`echo $authorization | sed 's/\r$//' | cut -d" " -f3`

    local message=(
		"HTTP/1.1 200 OK"
		"Content-Type: text/html; charset=UTF-8"
		"Content-Length: 31"
		"Server: netcat"
		""
		"$credentials"
		""
	)
    printf "%s\n" "${message[@]}"
}

function test_curl_encodes_basic_auth_for_you {
	rm -f /tmp/fifo
    rm -f ./demo/curl/incoming

    mkfifo /tmp/fifo
    ( answer) < <(nc -l -p 9999 < /tmp/fifo) > /tmp/fifo &
    
    body=$(curl --user login:password --silent --noproxy localhost, http://localhost:9999)
    cat ./demo/curl/incoming
    
    assertequals "$body" "bG9naW46cGFzc3dvcmQ="
}
