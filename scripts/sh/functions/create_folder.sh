#!/bin/bash

function create_folder {

  if [ -d "$1/$2" ]
  then
    rm -R "$1/$2"
  fi
  mkdir "$1/$2"

  if [ ! -z "$3" ]
  then
    mkdir "$1/$2/log"
  fi
}
