#ce script permet d'éxécuter l'ensemble des scripts du partage-termith
if [ -s "report.log" ]
then
	rm report.log
fi
touch report.log
time="/usr/bin/time -f 'realtime':%E\\nCPU:%P\\nExit:%x -o report.log -a "
echo $line >> report.log
echo "phase0" >> report.log
$time ./phase0-formatage-nom-fichier-alldata.sh
echo $line >> report.log
echo "phase1" >> report.log
$time ./phase1-norm-tei-alldata.sh
echo $line >> report.log
echo "phase2" >> report.log
$time ./phase2-supp-apos-alldata.sh
echo $line >> report.log
echo "phase3" >> report.log
$time ./phase3-supp-biblio-alldata.sh
echo $line >> report.log
echo "phase4" >> report.log
$time ./phase4-mettre-note-fin-alldata.sh
echo $line >> report.log
echo "phase5" >> report.log
$time ./phase5-mettre-commentaire-alldata.sh
echo $line >> report.log
echo "phase6" >> report.log
$time ./phase6-modifier-unicode-alldata.sh
echo $line >> report.log
echo "phase7" >> report.log
$time ./phase7-extraire-texte-alldata.sh
echo $line >> report.log
echo "phase8" >> report.log
$time ./phase8-creer-compagnon-termino-alldata.sh
echo $line >> report.log
echo "phase9" >> report.log
$time ./phase9-tokenize-tree-tagger-alldata.sh
echo $line >> report.log
echo "phase10-smarties" >> report.log
$time ./phase10-extraction-smarties-alldata.sh
echo $line >> report.log
echo "phase10" >> report.log
$time ./phase10-stdf-treetagger-alldata.sh
echo $line >> report.log
echo "phase11" >> report.log
$time ./phase11-stdf-termes-alldata.sh
echo $line >> report.log
echo "phase12" >> report.log
$time ./phase12-enrichissements-annotation-alldata.sh
echo $line >> report.log
echo "phase13" >> report.log
$time ./phase13-generation-syntita-alldata.sh
echo $line >> report.log
echo "phase14" >> report.log
$time ./phase14-generation-glawi-alldata.sh
echo $line >> report.log
echo "phase15" >> report.log
$time ./phase15-generation-lexique-trans-alldata.sh
echo $line >> report.log
echo "phase16" >> report.log
$time ./phase16-nettoyer-identifiant-alldata.sh
echo $line >> report.log
echo "phase17" >> report.log
$time ./phase17-extraction-sous-corpus-alldata.sh
echo $line >> report.log
echo "phase18" >> report.log
$time ./phase18-creation-fichier-global-alldata.sh
echo $line >> report.log
echo "phase19" >> report.log
$time ./phase19-creation-table-lexicale-alldata.sh
echo $line >> report.log
echo "phase20" >> report.log
$time ./phase20-count-table-lexicale-alldata.sh
echo $line >> report.log
echo "phase21" >> report.log
$time ./phase21-soustraction-table-lexical-alldata.sh
echo $line >> report.log
echo "phase22" >> report.log
$time ./phase22-extraction-corpus-alldata.sh
echo $line >> report.log
echo "phase23" >> report.log
$time ./phase23-count-corpus-alldata.sh
echo $line >> report.log
echo "phase24" >> report.log
$time ./phase24-learning-desamb-alldata.sh
mutt -s "report Termith Worflow" simonmeoni@aol.com < report.log
rm report.log
