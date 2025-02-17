#!/bin/bash

#Ejecutamos prokka para cada archivo resultado de los contigs

for file in $(<name_fasta.txt);
   do
	prokka --outdir ../prokka_${file} --addgenes --genus Staphylococcus --species aureus \
	--kingdom Bacteria --usegenus --mincontiglen 200 ${file}
   done