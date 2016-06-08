#!/bin/bash
source ../path
phase="phase12-enrichissements-annotation-discipline.sh"
./$phase archeologie &
./$phase chimie &
./$phase psychologie &
./$phase linguistique &
./$phase sciences_information_communication &
./$phase scientext &
wait
