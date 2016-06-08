#!/bin/bash
source ../path
cphase=10

create-folder $1 $cphase log

for f in "$disciplines/$1/phase9/"*.xml
do
    echo $f
    fb=`basename $f .xml`
    java -cp "$java/"premaf.jar com.repacking2premaf1.StandoffCLI \
	 -xml "$f" \
	 -term "$disciplines/$1/ressources/termsuite/terminologie.json" \
	 -json "$disciplines/$1/phase8/$fb.json" \
	 -txt "$disciplines/$1/phase7/$fb.txt" \
	 -out "$disciplines/$1/phase10/$fb.xml" \
	 -ser "$disciplines/$1/phase9/$fb.ser" \
	 -option "treetagger" 1>> /dev/null

    f=$fb".xml"
    verification-rnv $1 $cphase stdf
done
verifier-dossier-log $1 $cphase
