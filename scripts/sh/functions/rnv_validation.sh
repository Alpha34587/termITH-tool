#!/bin/bash
function rnv_validation {
  schema_rng="$rnc/tei-all.rnc"

  if [ ! -z "$2" ]
  then
    schema_rng="$rnc/stdf-custom-pos-lemma.rnc"
  fi

  echo "process and checking file: `basename $f`"
  rnv $schema_rng $f 2>> "$1/log/`basename $f`.log"

  if [ $? != 0 ]
  then
    echo "error(s) !"
  else
    rm "$1/log/`basename $f`.log"
  fi
  echo "---------------------------------------"
}
