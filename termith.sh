#!/bin/bash
source path
if [ ! -z "$1" ]
then
  create_folder $1 termith_result

  ./scripts/sh/0_files_validation.sh $1
  ./scripts/sh/1_extract_text.sh $1
  ./scripts/sh/2_termsuite_analyze.sh $1
  ./scripts/sh/3_generate_tokenize_tei.sh $1
  ./scripts/sh/4_morphosyntax_enrichment.sh $1
  ./scripts/sh/5_term_enrichment.sh $1
  ./scripts/sh/6_syntita_projection.sh $1
  ./scripts/sh/7_transdisplinaries_projection.sh $1
  ./scripts/sh/8_clean_result_folder.sh $1

else

  echo "missing folder argument"
  exit 125

fi
