#!/bin/bash

function generate-args {
array_discipline=(archeologie chimie psychologie linguistique sciences_information_communication scientext)
java_arg=""
for ((i=0;i<${#array_discipline[@]};i++)); do
    create-folder "${array_discipline[i]}" $c_phase log
    java_arg="$java_arg $disciplines/${array_discipline[i]}"
    rnv_args[i]="$disciplines/${array_discipline[i]}/phase$c_phase/"
done
}
