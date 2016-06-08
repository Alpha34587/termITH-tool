#!/bin/bash
source ../path
phase="phase7-extraire-texte-discipline.sh"
./$phase archeologie &
./$phase chimie &
./$phase psychologie &
./$phase linguistique &
./$phase sciences_information_communication &
./$phase scientext &
wait
