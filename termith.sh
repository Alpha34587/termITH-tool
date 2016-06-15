#!/bin/bash
source path
create_folder $1 termith_result

./scripts/sh/1_extract_text.sh $1
./scripts/sh/2_termsuite_analyze.sh $1
