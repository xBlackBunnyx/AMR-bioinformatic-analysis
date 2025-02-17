#!/bin/bash

#Calculamos la cobertura para la los resultados del blastn de plásmidos

for file in $(<blast2_name.txt);
	do
		#Calculamos la cobertura
		awk 'BEGIN {OFS="\t"}{$1=$1}NR==1{print $0, "coverage";next}{print $0, (($4-$6)*100)/$13}' ${file} > plasmid.cover.${file}
		#Nos quedamos con los que tengan un valor mayor a 95
		awk -v val=95 '!($14 < val)' plasmid.cover.${file} > Plasmid.${file}
	done