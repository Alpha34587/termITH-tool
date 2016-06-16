#!/bin/bash
source path

create_folder $1/log

for f in "$1/"*.xml
do
  rnv_validation $1
done
check_log_folder $1
if [ -d "$1/log" ]
then
  kill -SIGUSR1 `ps --pid $$ -oppid=`; exit
fi
