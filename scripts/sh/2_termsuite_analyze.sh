#!/bin/bash
source path

create_folder $1 termith_result/POS_Lemma
create_folder $1 termith_result/ressources

mkdir "$disciplines/$1/ressources"

java -Xms1g -Xmx5g -jar "$java/termsuite-api.jar" \
-r "$logiciels/termsuite-resources" \
-f "$1/termith_result/text" \
-t $treetagger \
-json "$1/termith_result/POS_Lemma/" \
-term "$1/termith_result/ressources/terminologie.json"
