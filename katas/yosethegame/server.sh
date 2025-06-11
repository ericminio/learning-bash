#!/bin/bash


function home {
  cat index.html
}

while true; do { \
  echo -ne "HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"; \
  home; } | nc -l -p 8333 -q 1 ; \ 
done