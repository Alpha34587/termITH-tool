#!/bin/bash
source path
mkdir $1/log

for f in "$1/"*.xml
do
  rnv_validation $1 test_corpus
done
