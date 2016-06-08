#!/bin/bash
source ../path
#On verifie si les dossiers de la phase 1 existe et on les supprime si besoin
create-folder $1/smarties 10
#Pour chaque fichier xml du dossier source de la discipline on génère un fichier normalisé et un log.

for f in "$disciplines/$1/smarties/phase9/"*.xml
do
    echo "------------------------------------------------------"
    echo "traitement de $f"
    $saxon "-s:$f" "-xsl:$xsl/phase10-extraction-smarties.xsl" "-o:$disciplines/$1/smarties/phase10/`basename $f`" 
done
