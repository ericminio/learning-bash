#!/bin/bash

function test_netcat_can_handle_http {
	local message=(
		"HTTP/1.1 200 OK"
		"Content-Type: text/html; charset=UTF-8"
		"Content-Length: 31"
		"Server: netcat"
		""
		"<html><body>hello</body></html>"
		""
	)    
    printf "%s\n" "${message[@]}" | nc -l -p 8333 &
    local body=`curl --silent --noproxy localhost, http://localhost:8333`
    
    assertequals "$body" "<html><body>hello</body></html>"
}
