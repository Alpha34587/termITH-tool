#!/bin/bash
source path

cphase=7
create-folder $1 text

for f in "$1/"*.xml
do
    fb=`basename $f .xml`
    echo "extract text for $fb.xml"
    xsltproc "$xsl/1_extract_text.xsl" "$f" > "$1/text/$fb.txt"
    if [[ ! -s "$1/text/$fb.txt" ]]
    then
	     rm "$1/text/$fb.txt"
    fi
done
