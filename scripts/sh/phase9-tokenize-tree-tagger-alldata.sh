#!/bin/bash
source ../path
phase="phase9-tokenize-tree-tagger-discipline.sh"
./$phase archeologie &
./$phase chimie &
./$phase psychologie &
./$phase linguistique &
./$phase sciences_information_communication &
./$phase scientext &
wait
