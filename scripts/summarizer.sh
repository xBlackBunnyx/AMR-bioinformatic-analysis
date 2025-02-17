#!/bin/bash

#Creamos un único archivo que tenga los resultados del AMR, plasmidfinder y platon

for sample in $(<seqs.txt); #Seleccionamos los resultados de AMR
   do
	for contig in $(tail -n+2 04_AMRblastn/AMR.${sample}.fasta.txt | cut -f 1 | sort -u); #Nos quedamos solo con el contig
	   do
		echo ${sample} >> uno.tmp #Nos quedamos con el nombre de la muestra
		grep -w "^${contig}" 04_AMRblastn/AMR.${sample}.fasta.txt >> dos.tmp #Nos quedamos con el nombre del contig
		#Hacemos un if para ver si el contig está en los resultados de plasmidfinder
		if grep -q -w "^${contig}" 05_plasmidfinder/Plasmid.${sample}.fasta.plasmid.txt;
		   then
		  	#Si está presente, nos quedamos con el plásmido asociado
		   	grep -w "^${contig}" 05_plasmidfinder/Plasmid.${sample}.fasta.plasmid.txt | head -n 1 | cut -f 2 >> tres.tmp
		   else
			echo "NA" >> tres.tmp #Si no está, que ponga NA
		fi
		#Hacemos un if para ver si el contig está en los resultados de platon
		if grep -q -w "^{$contig}" 06_platon/platon.${sample}.fasta.tsv;
		   then
			#Si está presente, nos quedamos con las características
			echo "Plasmido" >> cuatro.tmp
		   else
			echo -e "NA" >> cuatro.tmp #Si no está, que ponga NA
		fi
	   done
   	#Unimos todos los archivos temporales en uno para cada muestra
	paste uno.tmp dos.tmp tres.tmp cuatro.tmp | sed "1iMuestra\t$(head -n 1 04_AMRblastn/AMR.${sample}.fasta.txt)\tPlasmidFinder\Platon" > ${sample}_summary_table.txt
	rm *tmp #Eliminamos los archivos temporales
   done