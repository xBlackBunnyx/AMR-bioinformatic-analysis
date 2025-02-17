#!/bin/bash

#Hacemos un blast con la base de datos de plásmidos

for file in ./03_genomes/*.fasta;
	do
		blastn -query ${file} -db ./plasmidfinder_db/PlasmidsDB -perc_identity 0.95 -culling_limit 1 \
		-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore slen" \
		-out ${file}.plasmid.txt

	#Añadimos un encabezado a los archivos
		sed -i "1iqseqid\tsseqid\tpident\tlength\tmismatch\tgapopen\tqstart\tqend\tsstart\tsend\tevalue\tbitscore\tslen" ${file}.plasmid.txt
	done