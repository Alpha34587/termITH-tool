# TermiTH-Tool

## Installation

0. Configuration requise : Linux, Testé sur Ubuntu15.04
1. éxécuter la commande suivante : `git clone https://github.com/Alpha34587/termITH-tool`
2. s'assurer qu'une version de TreeTagger est installée sur la machine (téléchargement : http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/), pour vérifier : `echo "Bonjour !" | tree-tagger-french-utf8`
3. télécharger le modèle d'apprentissage français de treetagger (fichier .par): http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/data/french-par-linux-3.2-utf8.bin.gz
4. décompresser l'archive vers chemin/vers/treetagger/lib et renommer le fichier .par ainsi extrait avec le nom suivant : `french-utf8.par`
5. tester l'outil avec la commande suivante : `./termith -i test-corpus -tt chemin/vers/treetagger`
6. Si tout ce passe bien il y aura dans le dossier *test-corpus* les résultats de l'analyse dans le sous-dossier *termith_result*

## Comment l'utiliser ?

A la racine du projet git, éxécuter la commande suivante :

`./termith -i test-corpus -t chemin/vers/treetagger`

les options :

 - `-i` ou `--input` : chemin vers le dossier comprenant l'ensemble des fichiers tei d'un corpus à analyser
 - `-tt` ou `--treetagger` : chemin vers TreeTagger, il est néccessaire d'avoir treetagger sur sa machine pour que l'analyse puisse être éxécutée
 - `-d` ou `--debug` (optionelle) : conserve les différents fichiers d'analyse utilisés pendant l'éxécution

## Format d'Entrée

l'ensemble des fichiers en entrée doit être au format tei/xml valide en fonction du schéma schema/tei-all.rnc

## Format de Sortie

- *termith_result/ressources* : contient la terminologie en JSON et en TBX telle que produite par la plateforme TermSuite ainsi que deux ressources présentes au préalable, les lexiques transdisciplinaires et les syntagmes définis
- *termith_result/enriched_files* : ce dossier contient les fichiers tei enrichis. Chaque annotation générée par le programme à un élément `ns:standOff` qui lui est associé, ces éléments sont fils de l'élément `TEI` et se trouvent entre l'élément `teiHeader` et l'élément `text`. 

## Liens Utiles

- Lien vers TreeTagger : http://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/
- Lien vers le projet ANR termITH : http://www.atilf.fr/ressources/termith/
- Lien vers le git de termITH-ANR : https://github.com/termith-anr
- Lien vers le git de TermSuite (mais déjà inclus dans ce git) : 
