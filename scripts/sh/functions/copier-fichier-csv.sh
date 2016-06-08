#!/bin/bash

function copier-fichier-csv {
    	cp  "$f" "$disciplines/$1/phase0/$name"
	echo "`basename $f` ; $name"  >> "$disciplines/$1/phase0/fichier_correspondance.csv"
}
