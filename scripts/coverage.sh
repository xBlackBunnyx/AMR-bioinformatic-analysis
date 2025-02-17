#!/bin/bash

#Calculamos la cobertura para los resultados del blastn de resistencia a antibióticos

for file in $(<blast_name.txt);
	do
		#Calculamos la cobertura
		awk 'BEGIN {OFS="\t"}{$1=$1}NR==1{print $0, "coverage";next}{print $0, (($4-$6)*100)/$13}' ${file} > cover.${file}
		#Nos quedamos con los que tengan un valor mayor a 80
		awk -v val=80 '!($14 < val)' cover.${file} > final.${file}
	done