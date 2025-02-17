#!/bin/bash

#Hacemos un blast con nuestra base de datos de resistencia a antibióticos

for file in ./03_genomes/*.fasta;
	do
		blastn -query ${file} -db ./resfinder_db/AntibioticResistanceDB \
		-perc_identity 0.8 -culling_limit 1 \
		-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore slen" -out ${file}.txt

	#Añadimos un encabezado a los archivos
		sed -i "1iqseqid\tsseqid\tpident\tlength\tmismatch\tgapopen\tqstart\tqend\tsstart\tsend\tevalue\tbitscore\tslen" ${file}.txt

	done