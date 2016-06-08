#!/bin/bash

function normalisation-tei {
    $saxon "-s:$f" "-xsl:$xsl/$2" "-o:$disciplines/$1/phase1/`basename $f`" 2> /dev/null
}
