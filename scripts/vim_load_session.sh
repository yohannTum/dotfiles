#!/bin/bash

VIM_PATH="/usr/bin/vim"

# if we find a vim session, we load it
if [ -f "Session.vim" ] && [ -z $@ ] 
then
    $VIM_PATH -S
else # else, we take the arguments into account
    if [ $@ == "." ]
    then
        $VIM_PATH
    else
        $VIM_PATH "$@"
    fi
fi

