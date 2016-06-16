#!/bin/bash
source path
cphase=3_tei_tokenized

create_folder $1 termith_result/$cphase log

for f in "$1/termith_result/2_POS_Lemma/"*.json
do
  fb=`basename $f .json`
  java -cp "$java/premaf.jar" com.repacking2premaf1.TokenizerCLI \
  -xml "$1/$fb.xml" \
  -json "$f" \
  -txt "$1/termith_result/1_text/$fb.txt" \
  -out "$1/termith_result/3_tei_tokenized/$fb.xml" 1>> /dev/null

  f="$1/termith_result/3_tei_tokenized/$fb.xml"
  rnv_validation $1/termith_result/$cphase stdf
done

check_log_folder $1/termith_result/$cphase
