#!/bin/bash
source path

while [[ $# -gt 1 ]]
do
  key="$1"

  case $key in

    -i |--input)
    INPUT="$2"
    shift
    ;;

    -tt |--treetagger)
    TREETAGGER="$2"
    shift
    ;;

    -d|--DEBUG)
    case "$2" in
      "") DEBUG="no" ; shift 2 ;;
      *)
        if [ $2 != "no" ] && [ $2 != "yes" ]
        then
          echo "debug option : Unrecognized value \"$2\""
          exit 2
        fi
        DEBUG=$2
        shift 2 ;;
    esac
    ;;

    *) echo "$0: Unrecognized option $1" >&2
    exit 2
    ;;
  esac
  shift
done

if [ -z "$INPUT" ] || [ -z "$TREETAGGER" ]
then
  echo "Error: missing argument(s)"
  exit 2
fi

create_folder $INPUT termith_result

./scripts/sh/0_files_validation.sh $INPUT
./scripts/sh/1_extract_text.sh $INPUT
./scripts/sh/2_termsuite_analyze.sh $INPUT $TREETAGGER
./scripts/sh/3_generate_tokenize_tei.sh $INPUT
./scripts/sh/4_morphosyntax_enrichment.sh $INPUT
./scripts/sh/5_term_enrichment.sh $INPUT
./scripts/sh/6_syntita_projection.sh $INPUT
./scripts/sh/7_transdisplinaries_projection.sh $INPUT
if [ "$DEBUG" == "no" ]
then
  ./scripts/sh/8_clean_result_folder.sh $INPUT
fi
