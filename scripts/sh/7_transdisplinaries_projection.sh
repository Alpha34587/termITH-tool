#!/bin/bash
source path
cphase=enrich_files

java -Xms2g -Xmx5g -cp $java/multi-words-detection.jar org.termith.TransdisciplinaireDeployCLI \
-json "$1/termith_result/POS_Lemma" \
-tk "$1/termith_result/tei_tokenized" \
-tei "$1/termith_result/syntita_projection" \
-sy "ressources/syntita.json" \
-out "$1/termith_result/enrich_files"
