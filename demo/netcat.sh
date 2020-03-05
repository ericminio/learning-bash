#!/bin/sh

function test_netcat_can_handle_http {
    local server=`{
        echo 'HTTP/1.1 200 OK'
        echo 'Content-Type: text/html; charset=UTF-8'
        echo 'Server: netcat!'
        echo ''
        echo '<html><body>hello</body></html>'
    } | nc -l -p 8333` &
    local body=`curl --silent --noproxy localhost, http://localhost:8333`
    
    assertequals "$body" "<html><body>hello</body></html>"
}