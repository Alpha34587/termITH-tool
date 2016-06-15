#!/bin/bash
source path
cphase=syntita-projection

java -Xms2g -Xmx5g -cp $java/multi-words-detection.jar org.termith.SyntitaDeployCLI \
-json "$1/termith_result/POS_Lemma" \
-tk "$1/termith_result/tei_tokenized" \
-tei "$1/termith_result/terms_enrichment" \
-sy "ressources/syntita.json" \
-out "$1/termith_result/syntita-projection"
