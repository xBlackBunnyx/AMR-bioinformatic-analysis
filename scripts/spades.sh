#!/bin/bash

#Hacemos un ensamblaje de novo de las lecturas

for file in $(<seqs.txt);
    do
        spades.py -1 02_filtered_reads/${file}.filtered_R1.fastq.gz \
        -2 02_filtered_reads/${file}.filtered_R2.fastq.gz \
        --careful -k auto -t 2 -o ${file}_spades_out
    done