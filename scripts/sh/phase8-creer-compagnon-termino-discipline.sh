#!/bin/bash
source ../path
cphase=8

create-folder $1 $cphase

if [ -d "$disciplines/$1/ressources" ]
then
    rm -R "$disciplines/$1/ressources"
fi
mkdir "$disciplines/$1/ressources"
mkdir "$disciplines/$1/ressources/termsuite"

java -Xms1g -Xmx5g -jar "$java/termsuite-api.jar" \
-r "$logiciels/termsuite-resources" \
-f "$disciplines/$1/phase7" \
-t $treetagger \
-json "$disciplines/$1/phase8/" \
-term "$disciplines/$1/ressources/termsuite/terminologie.json"

if [ -d "$disciplines/$1/smarties" ]
then
    create-folder $1/smarties $cphase
    java -Xms1g -Xmx5g -jar "$java/termsuite-api.jar" \
	 -r "$logiciels/termsuite-resources" \
	 -f "$disciplines/$1/smarties/phase7" \
	 -t $treetagger \
	 -json "$disciplines/$1/smarties/phase8/"\
	 -term "$disciplines/$1/ressources/termsuite/terminologie-smarties.json"
    rm "$disciplines/$1/ressources/termsuite/terminologie-smarties.json"
fi

