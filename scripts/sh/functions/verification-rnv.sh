#!/bin/bash

function verification-rnv {
    schema_rng="$rnc/tei-all.rnc"
    if [ ! -z "$3" ]
    then
	schema_rng="$rnc/stdf-custom-pos-lemma.rnc"
    fi
    echo "traitement et verification du fichier: $f"
    rnv $schema_rng "$disciplines/$1/phase$2/`basename $f`" 2>> "$disciplines/$1/phase$2/log/`basename $f .xml`.log"

    if [ $? != 0 ]
    then
	echo "erreurs !"
	tail "$disciplines/$1/phase$2/log/`basename $f .xml`.log" >> report.log 
    else
	rm "$disciplines/$1/phase$2/log/`basename $f .xml`.log"
    fi
    echo "---------------------------------------"
 
}
