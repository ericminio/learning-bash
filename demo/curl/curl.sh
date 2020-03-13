#!/bin/bash

function extract {
    read request
    echo $request >> ./demo/curl/incoming
    read host
    echo $host >> ./demo/curl/incoming
    read authorization
    echo $authorization >> ./demo/curl/incoming
    read agent
    echo $agent >> ./demo/curl/incoming

    echo $authorization | cut -d" " -f3 | sed 's/\r$//' > ./demo/curl/credentials
}

function answer {
    local message=(
		"HTTP/1.1 200 OK"
		"Content-Type: text/html; charset=UTF-8"
		"Content-Length: 31"
		"Server: netcat"
		""
		"<html><body>hello</body></html>"
		""
	)
    printf "%s\n" "${message[@]}"
}

function test_curl_encodes_basic_auth_for_you {
	rm -f ./demo/curl/fifo
    rm -f ./demo/curl/incoming
    rm -f ./demo/curl/credentials

    mkfifo ./demo/curl/fifo
    ( extract && answer) < <(nc -l -p 9999 < ./demo/curl/fifo) > ./demo/curl/fifo &

    body=$(curl --user login:password --silent --noproxy localhost, http://localhost:9999)

    credentials=$(cat ./demo/curl/credentials)

    assertequals "$credentials" "bG9naW46cGFzc3dvcmQ="
}
