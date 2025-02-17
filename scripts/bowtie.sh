#!/bin/bash

#Alinea las secuencias con el fago y nos quedamos con las secuencias filtradas

mkdir 02_filtered_reads #Crea un nuevo directorio para las muestras filtradas

bowtie2-build phiX174_wg.fasta phiX_index #Convierte el archivo de referencia en un índice

for file in $(<seqs.txt);
    do  
        bowtie2 -p 2 -x phiX_index -1 01_clean_reads/${file}_1.clean.fastq.gz \
        -2 01_clean_reads/${file}_2.clean.fastq.gz \
        --un-conc-gz 02_filtered_reads/Sample_host_removed > 02_filtered_reads/Sample_mapped_and_unmapped.sam
    done