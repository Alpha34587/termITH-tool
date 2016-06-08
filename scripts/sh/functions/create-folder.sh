#!/bin/bash

function create-folder {
    
    if [ -d "$disciplines/$1/phase$2" ]
    then
	rm -R "$disciplines/$1/phase$2"
    fi
    mkdir "$disciplines/$1/phase$2"

    if [ ! -z "$3" ]
    then
	mkdir "$disciplines/$1/phase$2/log"
    fi
}
