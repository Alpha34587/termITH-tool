#!/bin/bash
source path
cphase=5_term_enrichment

create_folder $1 termith_result/$cphase log

for f in "$1/termith_result/4_morphosyntax_enrichment/"*.xml
do
    fb=`basename $f .xml`
    java -cp "$java/"premaf.jar com.repacking2premaf1.StandoffCLI \
	 -xml "$f" \
	 -term "$1/termith_result/ressources/terminologie.json" \
	 -json "$1/termith_result/2_POS_Lemma/$fb.json" \
	 -txt "$1/termith_result/1_text/$fb.txt" \
   -ser "$1/termith_result/3_tei_tokenized/$fb.ser" \
	 -out "$1/termith_result/5_term_enrichment/$fb.xml" \
	 -option "termes" 1>> /dev/null

    f="$1/termith_result/5_term_enrichment/$fb.xml"
    rnv_validation $1/termith_result/$cphase stdf
done
check_log_folder $1/termith_result/$cphase
