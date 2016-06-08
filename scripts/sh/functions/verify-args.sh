#!/bin/bash

function verify-args {
for ((i=0;i<${#rnv_args[@]};i++)); do
    current_path=${rnv_args[i]}
	for f in "$current_path"*.xml
	do
	    f=$f
	    verification-rnv ${array_discipline[i]} $c_phase stdf
	done
	verifier-dossier-log ${array_discipline[i]} $c_phase
done
}
