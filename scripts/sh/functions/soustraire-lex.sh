#!/bin/bash

function soustraire-lex {
    while read line
    do
	echo "traitement de : "$line
	filename=`echo $line | cut -d' ' -f 1`
	count=`echo $line | cut -d' ' -f 2`
	pos=`echo $line | grep -o "{.*}" | sed -e "s/{\|}//g"`
	IFS=' ' read -ra arrayPos <<< "$pos"
	for i in "${arrayPos[@]}"
	do
	    i=`echo $i | sed -e '0,/:/s//\t/'`
	    fileLine=`grep -P "\t$i" $disciplines/$1/phase21/$filename$3`
	    lineNum=`grep -nP "\t$i" $disciplines/$1/phase21/$filename$3|cut -f1 -d:`
	    newCount=$((`echo $fileLine | cut -d' ' -f 1` - $count))
	    if [[ $newCount =~ "-" ]]
	    then
		newCount="0"
	    fi
	    oldCount=`echo $fileLine | cut -d' ' -f 1`
	    oldName=`echo $fileLine | cut -d' ' -f 2`
	    oldPos=`echo $fileLine | cut -d' ' -f 3`
	    sed -i ""$lineNum"s/^[0-9]\+/"$newCount"/g" $disciplines/$1/phase21/$filename$3
	done
    done < $2
}
