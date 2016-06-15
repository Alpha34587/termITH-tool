#!/bin/bash
source path
cphase=morphosyntax_enrichment

create_folder $1 termith_result/$cphase log

for f in "$1/termith_result/tei_tokenized/"*.xml
do
    echo $f
    fb=`basename $f .xml`
    java -cp "$java/"premaf.jar com.repacking2premaf1.StandoffCLI \
	 -xml "$f" \
	 -term "$1/termith_result/ressources/terminologie.json" \
	 -json "$1/termith_result/POS_Lemma/$fb.json" \
	 -txt "$1/termith_result/text/$fb.txt" \
	 -out "$1/termith_result/morphosyntax_enrichment/$fb.xml" \
	 -ser "$1/termith_result/tei_tokenized/$fb.ser" \
	 -option "treetagger"

    f="$1/termith_result/morphosyntax_enrichment/$fb.xml"
    rnv_validation $1 $cphase stdf
done
check_log_folder $1 $cphase
