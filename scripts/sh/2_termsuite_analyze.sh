#!/bin/bash
source path

treetagger=$2
create_folder $1 termith_result/2_POS_Lemma
create_folder $1 termith_result/ressources

java -Xms1g -Xmx5g -jar "$java/termsuite-api.jar" \
-r "$logiciels/termsuite-resources" \
-f "$1/termith_result/1_text" \
-t $treetagger \
-json "$1/termith_result/2_POS_Lemma/" \
-term "$1/termith_result/ressources/terminologie.json"
