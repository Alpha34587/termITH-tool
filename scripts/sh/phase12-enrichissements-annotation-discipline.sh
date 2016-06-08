#!/bin/bash
source ../path
c_phase=12
create-folder $1 $c_phase log
file_smarties="$disciplines/$1/phase12/fichiers-avec-smarties.txt"
touch $file_smarties
#Pour chaque fichier xml du dossier source de la discipline on génère un fichier normalisé et un log.
for f in "$disciplines/$1/phase11/"*.xml
do
    fb=`basename $f`
    new_file="$disciplines/$1/phase12/$fb"
    if [ -f $disciplines/$1/smarties/phase10/$fb ]
    then
	$saxon -xsl:$xsl/phase12-enrichissements-annotation.xsl \
	       -s:$f \
	       -o:$new_file file="$disciplines/$1/smarties/phase10/$fb"
	
	verification-rnv $1 $c_phase stdf
	echo "`basename $f`" >> $file_smarties
    else
	$saxon -xsl:$xsl/phase12-annotation-sans-smarties.xsl -s:$f -o:$new_file 
	verification-rnv $1 $c_phase stdf
    fi
done
verifier-dossier-log $1 $c_phase
if [[ ! -s $file_smarties ]]
then
    rm $file_smarties
    fi
