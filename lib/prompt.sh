#!/bin/bash

echo "export PS1='\n\[\e[32m\]$(whoami) \[\e[33m\]in $(pwd)\[\e[0m\] \n> '" >> ~/.profile
source ~/.profile
