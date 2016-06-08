#!/bin/bash
source ../path
phase="phase10-extraction-smarties-discipline.sh"

./$phase psychologie &
./$phase archeologie &
./$phase linguistique &
wait
