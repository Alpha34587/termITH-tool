#!/bin/bash
source path
cphase=terms_enrichment

create_folder $1 termith_result/$cphase log

for f in "$1/termith_result/morphosyntax_enrichment/"*.xml
do
    fb=`basename $f .xml`
    java -cp "$java/"premaf.jar com.repacking2premaf1.StandoffCLI \
	 -xml "$f" \
	 -term "$1/termith_result/ressources/terminologie.json" \
	 -json "$1/termith_result/POS_Lemma/$fb.json" \
	 -txt "$1/termith_result/text/$fb.txt" \
   -ser "$1/termith_result/tei_tokenized/$fb.ser" \
	 -out "$1/termith_result/terms_enrichment/$fb.xml" \
	 -option "termes" 1>> /dev/null

    f="$1/termith_result/terms_enrichment/$fb.xml"
    rnv_validation $1 $cphase stdf
done
check_log_folder $1 $cphase
