#!/bin/bash
source ../path
cphase=9

create-folder $1 $cphase log

for f in "$disciplines/$1/phase8/"*.json
do
    echo $f
    fb=`basename $f .json`
    java -cp "$java/premaf.jar" com.repacking2premaf1.TokenizerCLI \
	 -xml "$disciplines/$1/phase6/$fb.xml" \
	 -json "$f" \
	 -txt "$disciplines/$1/phase7/$fb.txt" \
	 -out "$disciplines/$1/phase9/$fb.xml" 1>> /dev/null

    f=$fb".xml"
    verification-rnv $1 $cphase stdf
done

if [ -d "$disciplines/$1/smarties" ]
then
    create-folder $1/smarties 9
    for f in "$disciplines/$1/smarties/phase8/"*.json
    do
    echo $f
    fb=`basename $f .json`
    java -cp "$java/premaf.jar" com.repacking2premaf1.TokenizerCLI \
	 -xml "$disciplines/$1/smarties/phase6/$fb.xml" \
	 -json "$f" \
	 -txt "$disciplines/$1/smarties/phase7/$fb.txt" \
	 -out "$disciplines/$1/smarties/phase9/$fb.xml" 1>> /dev/null
    rm $disciplines/$1/smarties/phase9/$fb.ser
    done
fi
verifier-dossier-log $1 $cphase
