#!/bin/bash

#Eliminamos los contigs menores a 200 pares de bases

mkdir 03_genomes #Creamos una carpeta nueva para guardar los contigs

for dir in $(<spades_dir.txt);
	do
		prinseq-lite.pl -fasta ${dir}/contigs.fasta -min_len 200 \
		-out_good 03_genomes/$(basename "$dir") -out_bad null
	done