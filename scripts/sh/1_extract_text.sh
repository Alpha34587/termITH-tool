#!/bin/bash
source path

create_folder $1 termith_result/1_text

for f in "$1/"*.xml
do
    fb=`basename $f .xml`
    echo "extract text for $fb.xml"
    xsltproc "$xsl/1_extract_text.xsl" "$f" > "$1/termith_result/1_text/$fb.txt"
    if [[ ! -s "$1/termith_result/1_text/$fb.txt" ]]
    then
	     rm "$1/termith_result/1_text/$fb.txt"
    fi
done
