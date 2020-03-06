FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    curl \
    netcat

RUN echo "PS1='\n\[\e[32m\]$(whoami) \[\e[33m\]in $(pwd)\[\e[0m\] \n> '" >> ~/.bashrc      