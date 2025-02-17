#!/bin/bash

#Limpieza de los archivos fastq

mkdir 01_clean_reads

for file in $(<seqs.txt); #saca los nombres del txt
	do
		fastp -i 00_raw_data/${file}_1.fastq.gz -I 00_raw_data/${file}_2.fastq.gz \
        -o 01_clean_reads/${file}_1.clean.fastq.gz -O 01_clean_reads/${file}_2.clean.fastq.gz \
        --cut_front --cut_right -l 50 -q 25 --detect_adapter_for_pe --adapter_fasta adapters.fasta
	done
