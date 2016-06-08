#!/bin/bash
source ../path
c_phase=15
generate-args
java -Xms2g -Xmx5g -cp $java/multi-words-detection.jar org.termith.TransdisciplinaireCLI -d $java_arg \
     -json "/home/smeoni/partage-Termith/ressources/lexique-transdisciplinaire.json"
verify-args
