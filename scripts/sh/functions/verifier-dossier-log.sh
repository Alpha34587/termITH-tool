#!/bin/bash

function verifier-dossier-log {

if [ "$(ls -A $disciplines/$1/phase$2/log/)" ]; then
    echo "il y a des erreurs dans cette discipline ! Voir le dossier log dans phase $2"
else
    rm -R "$disciplines/$1/phase$2/log"
fi

}
