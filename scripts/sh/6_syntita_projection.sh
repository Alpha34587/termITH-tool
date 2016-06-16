#!/bin/bash
source path
cphase=syntita-projection

java -Xms2g -Xmx5g -cp $java/multi-words-detection.jar org.termith.SyntitaDeployCLI \
-json "$1/termith_result/2_POS_Lemma" \
-tk "$1/termith_result/3_tei_tokenized" \
-tei "$1/termith_result/5_term_enrichment" \
-sy "ressources/syntita.json" \
-out "$1/termith_result/6_syntita_projection"

cp ressources/syntita.json $1/termith_result/ressources
