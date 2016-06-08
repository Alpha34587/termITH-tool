#!/bin/bash
source ../path
phase="phase11-stdf-termes-discipline.sh"
./$phase archeologie &
./$phase chimie &
./$phase psychologie &
./$phase linguistique &
./$phase sciences_information_communication &
./$phase scientext &
wait
