#!/bin/bash

#Utilizamos kraken2 para confirmar la taxonomía de las muestras

mkdir 08_kraken2 #Creamos un directorio nuevo para guardar los resultados

for sample in $(<seqs.txt);
   do
	kraken2 03_genomes/${sample}.fasta --memory-mapping --use-mpa-style --threads 2 \
	--db kraken_db/minikraken_8GB_20200312 --report 08_kraken2/${sample}.report \
	--output 08_kraken2/${sample}.txt
   done