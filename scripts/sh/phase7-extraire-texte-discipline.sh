#!/bin/bash
source ../path
cphase=7
create-folder $1 7

for f in "$disciplines/$1/phase6/"*.xml
do
    fb=`basename $f .xml`
    echo "extraction du texte pour $fb.xml"
    xsltproc "$xsl/phase7-extraire-texte-discipline.xsl" "$f" > "$disciplines/$1/phase7/$fb.txt"
    if [[ ! -s "$disciplines/$1/phase7/$fb.txt" ]]
    then
	rm "$disciplines/$1/phase7/$fb.txt"
    fi
done

if [ -d "$disciplines/$1/smarties" ]
then
    create-folder $1/smarties 7
    for f in "$disciplines/$1/smarties/phase6/"*.xml
    do
    fb=`basename $f .xml`
    echo "extraction du texte pour $fb.xml"
    xsltproc "$xsl/phase7-extraire-texte-discipline.xsl" "$f" > "$disciplines/$1/smarties/phase7/$fb.txt"
    if [[ ! -s "$disciplines/$1/smarties/phase7/$fb.txt" ]]
    then
	rm "$disciplines/$1/smarties/phase7/$fb.txt"
    fi
    done
fi
