#!/bin/bash
source ../path
c_phase=13
generate-args
java -Xms2g -Xmx5g -cp $java/multi-words-detection.jar org.termith.SyntitaCLI -d $java_arg \
     -json "/home/smeoni/partage-Termith/ressources/syntita.json"
verify-args
