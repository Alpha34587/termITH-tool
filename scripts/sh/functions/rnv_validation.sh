#!/bin/bash
function rnv_validation {
  schema_rng="$rnc/tei-all.rnc"

  if [ ! -z "$3" ]
  then
    schema_rng="$rnc/stdf-custom-pos-lemma.rnc"
  fi

  echo "process and checking file: `basename $f`"
  rnv $schema_rng $f 2>> "$f.log"

  if [ $? != 0 ]
  then
    echo "error(s) !"
  fi
  echo "---------------------------------------"
}
