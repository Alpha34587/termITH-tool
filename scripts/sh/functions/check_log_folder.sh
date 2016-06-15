#!/bin/bash

function check_log_folder {

if [ "$(ls -A $1/termith_result/$2/log/)" ]; then
    echo "there are some tei error on the $2 phase see the log folder !"
else
    rm -R "$1/termith_result/$2/log"
fi

}
