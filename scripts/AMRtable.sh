#!/bin/bash

#Creamos un tabla para los datos obtenidos de AMR

for sample in $(<seqs.txt);
   do
	#Nos quedamos solo con el contig
	for contig in $(tail -n+2 04_AMRblastn/AMR.${sample}.fasta.txt | cut -f 1 | sort -u);
	   do
		echo ${sample} >> uno.tmp #Nos quedamos con el nombre de la muestra
		grep -w "^${contig}" 04_AMRblastn/AMR.${sample}.fasta.txt >> dos.tmp
	   done
	#Unimos todos los archivos temporales
	paste uno.tmp dos.tmp | sed "1iMuestra\t$(head -n 1 04_AMRblastn/AMR.${sample}.fasta.txt)" > ${sample}_AMR_table.txt
	rm *tmp #Eliminamos los archivos temporales
   done

#Unimos todas las tablas en una

for sample in $(<seqs.txt);
   do
	tail -n+2 ${sample}_AMR_table.txt >> all_AMR_table.txt
   done

#Añadimos el encabezado final
sed -i "1i$(head -n 1 ERR131800_AMR_table.txt)" all_AMR_table.txt