#!/bin/bash

function check_log_folder {

if [ "$(ls -A $1/log/)" ]; then
    echo "there are some tei error on the $1 phase see the log folder !"
    echo "---------------------------------------"
else
    rm -R "$1/log"
fi

}
