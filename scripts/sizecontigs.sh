#!/bin/bash

#Cuenta el tamaño de cada contig de cada muestra

for file in $(<name_fasta.txt);
	do
		grep "^>" ${file} | cut -d '_' -f 4 > ${file}_contig_number.txt
	done